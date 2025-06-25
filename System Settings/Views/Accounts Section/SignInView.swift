//
//  SignInView.swift
//  System Settings
//
//  System Settings > Sign in
//

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    @State private var localization = LocalizationManager(bundleURL: URL(fileURLWithPath: "/System/Library/PrivateFrameworks/AuthKitUI.framework"))

    var body: some View {
        VStack(spacing: 20) {
            // Apple logo header image
            Image(.signOutHeader)
            
            // Header title
            Text("SPYGLASS_TITLE".localized(using: localization))
                .font(.title)
                .fontWeight(.bold)
            
            // Body text
            Text("SPYGLASS_BODY".localized(using: localization))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
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
            HStack {
                Spacer()
                Button("AUTHORIZE_BUTTON_TITLE".localized(using: localization)) {}
                    .disabled(username.isEmpty)
                    .padding(.trailing, 22)
                    .keyboardShortcut(.defaultAction)
            }
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
        .frame(width: 490, height: 300)
        .navigationTitle("SIGN_IN_WATCH_OS".localized(using: localization))
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

#Preview {
    SignInView()
        .frame(height: 600)
}
