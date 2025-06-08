//
//  DividerGeometryView.swift
//  System Settings
//

import SwiftUI

struct DividerGeometryView: View {
    @Binding var dividerOpacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onChange(of: geometry.frame(in: .scrollView).minY) {
                    dividerOpacity = (94.0 - geometry.frame(in: .scrollView).minY) / 4
                }
        }
    }
}
