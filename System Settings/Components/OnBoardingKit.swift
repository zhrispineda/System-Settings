//
//  OnBoardingKit.swift
//  System Settings
//

import SwiftUI

struct OnBoardingKitControllerView: NSViewControllerRepresentable {
    let bundleIdentifier: String
    @Binding var showPopover: Bool
    var resetShowPopover: () -> Void

    func makeNSViewController(context: Context) -> OBContainerController {
        OBContainerController(bundleIdentifier: bundleIdentifier, resetShowPopover: resetShowPopover)
    }

    func updateNSViewController(_ viewController: OBContainerController, context: Context) {
        viewController.updateShowPopover(showPopover)
    }
}

final class OBContainerController: NSViewController {
    let bundleIdentifier: String
    let resetShowPopover: () -> Void
    private var OBController: NSViewController?
    private var OBControllerObject: NSObject?

    init(bundleIdentifier: String, resetShowPopover: @escaping () -> Void) {
        self.bundleIdentifier = bundleIdentifier
        self.resetShowPopover = resetShowPopover
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard dlopen("/System/Library/PrivateFrameworks/OnBoardingKit.framework/OnBoardingKit", RTLD_NOW) != nil else {
            return
        }

        guard let linkClass = NSClassFromString("OBPrivacyLinkController") as? NSObject.Type else {
            return
        }

        let selector = NSSelectorFromString("linkWithBundleIdentifier:")
        guard linkClass.responds(to: selector),
              let bundle = linkClass.perform(selector, with: bundleIdentifier)?.takeUnretainedValue(),
              let viewController = bundle as? NSViewController else {
            return
        }

        self.OBController = viewController
        self.OBControllerObject = (bundle as! NSObject)

        addChild(viewController)
        view.addSubview(viewController.view)
    }

    func updateShowPopover(_ show: Bool) {
        guard let object = OBControllerObject else { return }

        Task {
            if show {
                if object.responds(to: NSSelectorFromString("_linkPressed")) {
                    object.perform(NSSelectorFromString("_linkPressed"))
                }

                self.resetShowPopover()
            }
        }
    }
}

struct OBPrivacyLinkController: NSViewControllerRepresentable {
    let bundleIdentifier: String

    func makeNSViewController(context: Context) -> NSViewController {
        guard dlopen("/System/Library/PrivateFrameworks/OnBoardingKit.framework/OnBoardingKit", RTLD_NOW) != nil else {
            return NSViewController()
        }

        guard let linkClass = NSClassFromString("OBPrivacyLinkController") as? NSObject.Type else {
            return NSViewController()
        }

        let selector = NSSelectorFromString("linkWithBundleIdentifier:")
        if linkClass.responds(to: selector),
           let controllerObj = linkClass.perform(selector, with: bundleIdentifier)?.takeUnretainedValue(),
           let viewController = controllerObj as? NSViewController {

            controllerObj.setValue(false, forKey: "displayLargeIcon")

            return viewController
        }

        return NSViewController()
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
}
