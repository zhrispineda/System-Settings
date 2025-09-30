//
//  SignInView.swift
//  System Settings
//
//  System Settings > Sign in
//

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    let localization = LocalizationManager(bundleURL: "/System/Library/PrivateFrameworks/AuthKitUI.framework")
    let accountTable = LocalizationManager(bundleURL: "/System/Library/ExtensionKit/Extensions/AppleIDSettings.appex")
    
    var body: some View {
        VStack(spacing: 20) {
            // Apple logo header image
            if let header = NSImage.asset(path: "/System/Library/PrivateFrameworks/AuthKitUI.framework", name: "signOutHeaderIcon") {
                Image(nsImage: header)
            }
            
            // Header title
            Text("SPYGLASS_TITLE".localized(using: localization))
                .font(.title)
                .fontWeight(.bold)
            
            // Body text
            Text("SPYGLASS_BODY".localized(using: localization))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .padding(.bottom, 10)
            
            // Text field
            HStack {
                Text("EMAIL_OR_PHONE_PLACEHOLDER".localized(using: localization))
                TextField("REQUIRED_PLACEHOLDER".localized(using: localization), text: $username)
                    .textCase(.lowercase)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 22)
            }
            .frame(width: 430)
            .background {
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(.fill, lineWidth: 1)
                    .padding(-8)
            }
            
            // Continue button
            Button("AUTHORIZE_BUTTON_TITLE".localized(using: localization)) {}
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(username.isEmpty)
                .padding(.trailing, 22)
                .keyboardShortcut(.defaultAction)
                .padding(.bottom)
            
            // See how your data is managed… button
            OBPrivacyLinkController(bundleIdentifier: "com.apple.onboarding.appleid")
                .frame(maxWidth: 460)
            
            HStack {
                // Forgot Password button
                Button("FORGOT_PASSWORD".localized(using: localization)) {}
                Spacer()
                // Don‘t Have an Account? button
                Button("SPYGLASS_CREATE".localized(using: localization)) {}
                // Help topic button
                HelpButton(topicID: "mchla99dc8da")
            }
            .padding([.horizontal, .top])
        }
        .background(WindowAccessor { window in
            window.titlebarAppearsTransparent = true
        })
        .frame(width: 490, height: 300)
        .navigationTitle("SPYGLASS_TITLE_SIGN_IN".localized(using: accountTable))
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack {
                    Button("", systemImage: "chevron.left") {}
                        .disabled(true)
                    Button("", systemImage: "chevron.right") {}
                        .disabled(true)
                }
            }
        }
    }
}

struct WindowAccessor: NSViewRepresentable {
    let callback: (NSWindow) -> Void
    
    func makeNSView(context: Context) -> NSView {
        let nsView = NSView()
        Task {
            if let window = nsView.window {
                callback(window)
            }
        }
        return nsView
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}

#Preview {
    SignInView()
        .frame(height: 600)
}
