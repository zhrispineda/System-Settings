//
//  MacInfo.swift
//  System Settings
//

import Foundation
import AppKit
import os

///  A utility type that contains hardware information and device-related files based on Mac identifiers.
class MacInfo {
    private let infoTable = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/AboutExtension.appex", stringsFile: "SupportLinks")
    let fileManager = FileManager.default
    let resourceKeys: [URLResourceKey] = [.volumeNameKey]
    let logger = Logger()
    
    /// Returns the total memory in GB from ProcessInfo as a string value. Does not include the `GB` suffix.
    static var memory: String {
        let memory = ProcessInfo.processInfo.physicalMemory
        let formatted = memory / (1024 * 1024 * 1024)
        return String(formatted)
    }
    
    /// Opens the included `ENERGY STAR.pdf` file from `/System/Library/ProductDocuments/ProductGuides/`.
    func energyStarFile() -> Void {
        /// File name is based on `ENERGY_STAR` in `/System/Library/ExtensionKit/Extensions/AboutExtension.appex`
        let fileName = "ENERGY_STAR".localized(using: infoTable)
        let fileURL = "/System/Library/ProductDocuments/ProductGuides/\(fileName)"
        
        if NSWorkspace.shared.open(URL(fileURLWithPath: fileURL)) {
            logger.log("Successfully opened ENERGY STAR file: \(fileURL)")
        } else {
            logger.error("Error opening ENERGY STAR file: \(fileURL)")
        }
    }
    
    /// Returns the device's SPConfigCode for opening the matching Apple Support Tech Specs page. Based on `AppleSystemInfo.framework`
    /// - Parameter deviceCode: The `String` device identifier
    /// - Returns: `String` SPConfigCode for use with support-sp.apple.com
    func helpPage(deviceCode: String) -> String {
        let path = "/System/Library/PrivateFrameworks/AppleSystemInfo.framework/Versions/A/Resources/SPConfigCodes.plist"
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
              let dict = plist as? [String: Any] else {
            print("Could not load plist for identifier: \(deviceCode)")
            return ""
        }
        
        if let value = dict[deviceCode] as? String {
            return value
        }
        
        return ""
    }
    
    /// Opens the path `/Library/Documentation/`.
    func openDocumentation() -> Void {
        let fileURL = "/Library/Documentation/"
        if NSWorkspace.shared.open(URL(fileURLWithPath: fileURL)) {
            logger.log("Successfully opened Finder with path: \(fileURL)")
        } else {
            logger.error("Error opening Finder with path: \(fileURL)")
        }
    }
    
    /// Open `License.lpdf` file
    func softwareLicenseFile() -> Void {
        /// File name is based on `OSX_LICENSE` in `/System/Library/ExtensionKit/Extensions/AboutExtension.appex`
        let fileName = "OSX_LICENSE".localized(using: infoTable)
        let fileURL = "/Library/Documentation/\(fileName)"

        if NSWorkspace.shared.open(URL(fileURLWithPath: fileURL)) {
            logger.log("Successfully opened Software License Agreement file: \(fileURL)")
        } else {
            logger.error("Error opening Software License Agreement file: \(fileURL)")
        }
    }
    
    /// Opens the Regulatory Certification `.lpdf` file located in /System/Library/ProductDocuments/RegulatoryCertifications/.
    ///
    /// The key values for `RegulatoryModelNumber` and `TargetSubType` are obtained by MGHelper.
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
    
    /// Returns the `NSImage` product image from `/System/Library/CoreServices/CoreTypes.bundle/Contents/Library/`.
    ///
    /// Device housing color keys, `ThinningProductType` and `DeviceEnclosureColor`, are obtained by MGHelper.
    func color() -> NSImage? {
        let thinningProductType = MGHelper.read(key: "0+nc/Udy4WNG8S+Q7a/s1A") ?? "UNKNOWN"
        let deviceEnclosureColor = MGHelper.read(key: "JhEU414EIaDvAz8ki5DSqw") ?? "UNKNOWN"
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
    
    /// Returns a tuple of `String` values, model `name`, and model `year`.
    ///
    /// Obtains the `marketing-name` key value from MGHelper and formats it separately to `name` and `year` variables.
    func model() -> (name: String, year: String) {
        let fullString = MGHelper.read(key: "Z/dqyWS6OZTRy10UcmUAhw") ?? "UNKNOWN"
        let trimmedString = fullString.trimmingCharacters(in: .whitespaces)
        
        if let openParenIndex = trimmedString.firstIndex(of: "("),
           let closeParenIndex = trimmedString.firstIndex(of: ")") {
            
            let modelName = trimmedString[..<openParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelYear = trimmedString[trimmedString.index(after: openParenIndex)..<closeParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelNameString = String(modelName)
            let modelYearString = String(modelYear)
            
            return (name: modelNameString.localized(using: infoTable), year: modelYearString.localized(using: infoTable))
        }
        return (name: "UNKNOWN".localized(using: infoTable), year: "UNKNOWN".localized(using: infoTable))
    }
    
    /// Returns a tuple of `String` values for OS `name`, `version`, `build`, and `subtext`.
    ///
    /// Formats OS information from operatingSystemVersionString, which is obtained from MGHelper.
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
        
        return (name: systemName, version: String(splitString[1]), build: String(splitString[3]), subtext: "\(betaBuild ? "OS_BETA_VERSION_BUILD" : "OS_VERSION_BUILD")".localizedFormatted(using: infoTable, String(splitString[1]), String(splitString[3])))
    }
    
    /// Returns a tuple of the first drive's `name` and `count`.
    ///
    /// Uses FileManager to obtain storage information.
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
