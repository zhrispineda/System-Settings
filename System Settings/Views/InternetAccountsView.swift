//
//  InternetAccountsView.swift
//  System Settings
//
//  System Settings > Internet Accounts
//

import SwiftUI

struct InternetAccountsView: View {
    var body: some View {
        CustomForm(title: "Internet Accounts") {
            Section {
                Text("No accounts")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .center)
            } footer: {
                Button("Add Account…") {}
                HelpButton(topicID: "mh35705")
            }
        }
    }
}

#Preview {
    InternetAccountsView()
}
