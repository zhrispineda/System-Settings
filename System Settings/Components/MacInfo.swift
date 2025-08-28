//
//  MacInfo.swift
//  System Settings
//

import Foundation
import AppKit
import os

class MacInfo {
    let fileManager = FileManager.default
    let resourceKeys: [URLResourceKey] = [.volumeNameKey]
    let logger = Logger()
    
    // Use ProcessInfo to get memory in GB
    static var memory: String {
        let memory = ProcessInfo.processInfo.physicalMemory
        let formatted = memory / (1024 * 1024 * 1024)
        return String(formatted)
    }
    
    // Get RegulatoryModelNumber and TargetSubType key values to open Regulatory Certification .lpdf file
    func regulatoryFile() -> Void {
        let regulatoryModelNumber = MGHelper.read(key: "97JDvERpVwO+GHtthIh7hA") // RegulatoryModelNumber
        let targetSubType = MGHelper.read(key: "oYicEKzVTz4/CxxE05pEgQ")?.dropLast(2) // TargetSubType
        let fileURL = "/System/Library/ProductDocuments/RegulatoryCertifications/RegulatoryCertification-\(regulatoryModelNumber ?? "A2485")-\(targetSubType ?? "J316s")-CHN.lpdf"
        
        if NSWorkspace.shared.open(URL(fileURLWithPath: fileURL)) {
            logger.log("Successfully opened Regulatory Certification: \(fileURL)")
        } else {
            logger.error("Error opening Regulatory Certification: \(fileURL)")
        }
    }
    
    // Get device housing color based off of ThinningProductType and DeviceEnclosureColor
    func color() -> NSImage? {
        let thinningProductType = MGHelper.read(key: "0+nc/Udy4WNG8S+Q7a/s1A") ?? "UNKNOWN" // ThinningProductType
        let deviceEnclosureColor = MGHelper.read(key: "JhEU414EIaDvAz8ki5DSqw") ?? "UNKNOWN" // DeviceEnclosureColor
        var iconPath = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Library/"
        
        switch thinningProductType {
        case "Mac16,10", "Mac16,15": // Mac mini (2024)
            iconPath += "CoreTypes-0021.bundle/Contents/Resources/com.apple.macmini-2024.icns"
        case "Mac16,3", "Mac16,2": // iMac (24-inch, 2024, Four+Two ports)
            switch deviceEnclosureColor {
            case "6": // Silver
                iconPath += ""
            case "9": // Yellow
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-yellow.icns"
            case "10": // Green
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-green.icns"
            case "11": // Blue
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-blue.icns"
            case "12": // Pink
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-pink.icns"
            case "13": // Purple
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-purple.icns"
            case "14": // Orange
                iconPath += "CoreTypes-0020.bundle/Contents/Resources/com.apple.imac-2024-orange.icns"
            default:
                iconPath += ""
            }
        case "Mac16,1", "iMac16,6", "iMac16,8": // MacBook Pro (14-inch, 2023+2024)
            switch deviceEnclosureColor {
            case "9": // Space Black
                iconPath += "CoreTypes-0013.bundle/Contents/Resources/com.apple.macbookpro-14-late-2023-2-space-black.icns"
            default:
                iconPath += ""
            }
        case "Mac15,7", "Mac15,9", "Mac15,11", "Mac16,5", "Mac16,7": // MacBook Pro (16-inch, Nov 2023+2024)
            switch deviceEnclosureColor {
            case "9": // Space Black
                iconPath += "CoreTypes-0013.bundle/Contents/Resources/com.apple.macbookpro-16-late-2023-2-space-black.icns"
            default:
                iconPath += ""
            }
        case "Mac15,13", "Mac14,15": // MacBook Air (15-inch, M3, 2023+2024)
            switch deviceEnclosureColor {
            case "1": // Silver
                iconPath += "CoreTypes-0009.bundle/Contents/Resources/com.apple.macbookair-15-2023-silver.icns"
            case "2": // Space Gray
                iconPath += "CoreTypes-0009.bundle/Contents/Resources/com.apple.macbookair-15-2023-space-gray.icns"
            case "7": // Midnight
                iconPath += "CoreTypes-0009.bundle/Contents/Resources/com.apple.macbookair-15-2023-midnight.icns"
            case "8": // Starlight
                iconPath += "CoreTypes-0009.bundle/Contents/Resources/com.apple.macbookair-15-2023-starlight.icns"
            default:
                iconPath += ""
            }
        default: // Fallback
            iconPath += "CoreTypes-0013.bundle/Contents/Resources/com.apple.macbookpro-16-late-2023-2-space-black.icns"
        }
        
        var iconImage: NSImage? {
            let fileURL = URL(fileURLWithPath: iconPath)
            return NSImage(contentsOf: fileURL)
        }
        
        return iconImage
    }
    
    // Get `marketing-name` key value and then format it separately to model and year variables
    func model() -> (name: String, year: String) {
        let fullString = MGHelper.read(key: "Z/dqyWS6OZTRy10UcmUAhw") ?? "UNKNOWN"
        let trimmedString = fullString.trimmingCharacters(in: .whitespaces)
        
        if let openParenIndex = trimmedString.firstIndex(of: "("),
           let closeParenIndex = trimmedString.firstIndex(of: ")") {
            
            let modelName = trimmedString[..<openParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelYear = trimmedString[trimmedString.index(after: openParenIndex)..<closeParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelNameString = String(modelName)
            let modelYearString = String(modelYear)
            
            return (name: modelNameString.localize(table: "SPInfo"), year: modelYearString.localize(table: "SPInfo"))
        }
        return (name: "UNKNOWN".localize(table: "SPInfo"), year: "UNKNOWN".localize(table: "SPInfo"))
    }
    
    // Use regular expression to get and format OS information from operatingSystemVersionString
    func system() -> (name: String, version: String, build: String, subtext: String) {
        let pattern = "[^A-Za-z0-9.]+"
        let fullString = ProcessInfo.processInfo.operatingSystemVersionString
        let regexString = fullString.replacingOccurrences(of: pattern, with: " ", options: [.regularExpression])
        let splitString = regexString.split(separator: " ")
        let betaBuild = splitString[3].last!.isLetter
        var systemName = String()
        
        switch splitString[1].prefix(2) {
        case "26":
            systemName = "Tahoe"
        case "15":
            systemName = "Sequoia"
        case "14":
            systemName = "Sonoma"
        case "13":
            systemName = "Ventura"
        default:
            systemName = "UNKNOWN"
        }
        
        return (name: systemName, version: String(splitString[1]), build: String(splitString[3]), subtext: "\(betaBuild ? "OS_BETA_VERSION_BUILD" : "OS_VERSION_BUILD")".localize(table: "SPInfo", String(splitString[1]), String(splitString[3])))
    }
    
    // Check name and count of drives
    func drives() -> (name: String, count: Int) {
        var drives: [String] = []
        
        if let volumes = fileManager.mountedVolumeURLs(includingResourceValuesForKeys: resourceKeys, options: .skipHiddenVolumes) {
            for volume in volumes {
                if let resources = try? volume.resourceValues(forKeys: Set(resourceKeys)),
                   let name = resources.volumeName {
                    drives.append(name)
                }
            }
        }
        
        return (name: drives[0], count: drives.count)
    }
}
