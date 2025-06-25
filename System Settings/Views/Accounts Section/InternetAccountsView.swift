//
//  InternetAccountsView.swift
//  System Settings
//
//  System Settings > Internet Accounts
//

import SwiftUI

struct InternetAccountsView: View {
    @State private var localizationManager = LocalizationManager(bundleURL: URL(fileURLWithPath: "/System/Library/PrivateFrameworks/AccountsUISettings.framework"))

    var body: some View {
        CustomForm(title: "INTERNET_ACCOUNTS_MAIN_TITLE".localized(using: localizationManager)) {
            Section {
                Text("NO_ACCOUNTS".localized(using: localizationManager))
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } footer: {
                HStack {
                    Button("ADD_ACCOUNT_BUTTON_LABEL".localized(using: localizationManager)) {}
                    HelpButton(topicID: "mh35705")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

#Preview {
    InternetAccountsView()
}
