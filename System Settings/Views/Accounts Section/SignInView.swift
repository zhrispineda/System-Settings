//
//  SignInView.swift
//  System Settings
//
//  System Settings > Sign in
//

import SwiftUI

struct SignInView: View {
    @State private var username = ""
    let table = "AuthKitUI"
    
    var body: some View {
        VStack(spacing: 20) {
            // Apple logo header image
            Image(.signOutHeader)
            
            // Header title
            Text("SPYGLASS_TITLE", tableName: table)
                .font(.title)
                .fontWeight(.bold)
            
            // Body text
            Text("SPYGLASS_BODY", tableName: table)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 80)
                .padding(.bottom, 10)
            
            // Text field
            HStack {
                Text("EMAIL_OR_PHONE_PLACEHOLDER", tableName: table)
                TextField("REQUIRED_PLACEHOLDER".localize(table: table).lowercased(), text: $username)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.plain)
                    .frame(minHeight: 22)
            }
            .frame(width: 380)
            .background {
                RoundedRectangle(cornerRadius: 5.0)
                    .foregroundStyle(.background)
                    .padding(-8)
                    .shadow(radius: 0.0, y: 0.3)
            }
            
            // Continue button
            HStack {
                Spacer()
                Button("AUTHORIZE_BUTTON_TITLE".localize(table: table)) {}
                    .disabled(username.isEmpty)
                    .padding(.trailing, 51)
                    .keyboardShortcut(.defaultAction)
            }
            .padding(.bottom)
            
            // Privacy information text
            Text("This Mac will be associated with your Apple Account and data such as photos, contacts, and documents will be stored in iCloud so you can access them on other devices.")
                .fixedSize(horizontal: false, vertical: true)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // See how your data is managed… button
            Button {} label: {
                HStack(spacing: 5) {
                    Image(_internalSystemName: "privacy.handshake")
                    Text("AUTHORIZATION_PRIVACY_LEARN_MORE", tableName: table)
                }
            }
            .font(.callout)
            .foregroundStyle(.blue)
            .buttonStyle(.plain)
            
            HStack {
                // Forgot Password button
                Button("FORGOT_PASSWORD".localize(table: table)) {}
                Spacer()
                // Don‘t Have an Account? button
                Button("SPYGLASS_CREATE".localize(table: table)) {}
                // Help topic button
                HelpButton(topicID: "mchla99dc8da")
            }
            .padding([.horizontal, .top])
        }
        .frame(width: 490, height: 300)
        .navigationTitle("SIGN_IN_WATCH_OS".localize(table: table))
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
