//
//  SettingsModel.swift
//  System Settings
//

import SwiftUI

enum SettingsOptions: String, Identifiable, CaseIterable, Hashable {
    case general = "General"
    case accessibility = "Accessibility"
    
    var id: String { rawValue }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .general:
            GeneralView()
        case .accessibility:
            EmptyView()
        }
    }
    
    var color: Color {
        switch self {
        case .general:
            .gray
        case .accessibility:
            .blue
        }
    }
    
    var symbol: String {
        switch self {
        case .general:
            "gear"
        case .accessibility:
            "accessibility"
        }
    }
}
