//
//  IconServicesHelper.swift
//  System Settings
//

import SwiftUI

enum IconAppearance: Int {
    case light, dark
}

enum IconVariant: Int {
    case none = 0
    case tinted = 2
    case clear = 3
}

@MainActor
final class IconServicesHelper {
    static let shared = IconServicesHelper()
    
    private func createIconFactory(bundleID: String) -> NSObject? {
        guard let factoryClass = NSClassFromString("ISIconFactory") else {
            return nil
        }
        
        guard let allocated = (factoryClass as AnyObject).perform(NSSelectorFromString("alloc")) else {
            return nil
        }
        
        let initSel = NSSelectorFromString("initWithBundleIdentifier:")
        guard let initialized = (allocated.takeUnretainedValue() as AnyObject).perform(initSel, with: bundleID) else {
            return nil
        }
        
        guard let iconObj = initialized.takeRetainedValue() as? NSObject else {
            return nil
        }
        
        return iconObj
    }
    
    private func createDescriptor(
        appearance: IconAppearance,
        variant: IconVariant,
        size: CGFloat
    ) -> NSObject? {
        guard let descriptorClass = NSClassFromString("ISImageDescriptor") else {
            return nil
        }
        
        guard let allocated = (descriptorClass as AnyObject).perform(NSSelectorFromString("alloc")) else {
            return nil
        }
        
        let initSel = NSSelectorFromString("initWithSize:scale:")
        guard let initialized = (allocated.takeUnretainedValue() as AnyObject).perform(initSel, with: NSValue(size: CGSize(width: 128, height: 128)), with: NSNumber(value: 1.0)) else {
            return nil
        }
        
        guard let desc = initialized.takeRetainedValue() as? NSObject else {
            return nil
        }
        
        desc.setValue(NSValue(size: CGSize(width: size, height: size)), forKey: "size")
        desc.setValue(NSNumber(value: 1.0), forKey: "scale")
        desc.setValue(NSNumber(value: appearance.rawValue), forKey: "appearance")
        desc.setValue(NSNumber(value: variant.rawValue), forKey: "appearanceVariant")
        
        let accentColor = NSColor.controlAccentColor
        if let ifColorClass = NSClassFromString("IFColor") {
            if let concreteColor = accentColor.usingColorSpace(.sRGB) ?? accentColor.usingColorSpace(.deviceRGB) {
                let cgColor = concreteColor.cgColor
                let allocSel = NSSelectorFromString("alloc")
                if let allocated = (ifColorClass as AnyObject).perform(allocSel) {
                    if let initialized = (allocated.takeUnretainedValue() as AnyObject).perform(NSSelectorFromString("initWithCGColor:"), with: cgColor) {
                        desc.setValue(initialized.takeRetainedValue(), forKey: "tintColor")
                    }
                }
            }
        }
        
        return desc
    }
    
    func getAppIcon(
        bundleID: String,
        appearance: IconAppearance,
        variant: IconVariant,
        size: CGFloat
    ) -> NSImage? {
        guard let iconObj = self.createIconFactory(bundleID: bundleID) else {
            return nil
        }
        
        guard let descriptor = self.createDescriptor(
            appearance: appearance,
            variant: variant,
            size: size
        ) else {
            return nil
        }
        
        let prepareImageSel = NSSelectorFromString("prepareImageForDescriptor:")
        if iconObj.responds(to: prepareImageSel) {
            _ = iconObj.perform(prepareImageSel, with: descriptor)
        }
        
        let cgImageDescriptorSel = NSSelectorFromString("CGImageForDescriptor:")
        if iconObj.responds(to: cgImageDescriptorSel) {
            if let imgResult = iconObj.perform(cgImageDescriptorSel, with: descriptor) {
                let cgImage = imgResult.takeUnretainedValue() as! CGImage
                print("Got CGImage for \(bundleID) with size: \(cgImage.width)x\(cgImage.height)")
                let nsImage = NSImage(cgImage: cgImage, size: NSZeroSize)
                return nsImage
            }
        }
        
        return nil
    }
}
