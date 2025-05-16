//
//  SearchView.swift
//  System Settings
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        GeometryReader { geo in
            List {
                VStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.thin)
                        .padding(.bottom, 5)
                    Text("No Results")
                    Text("No results for “\(searchText)“")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, minHeight: 0, idealHeight: geo.size.height, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listRowSeparator(.hidden)
            }
            .scrollDisabled(!searchText.isEmpty)
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .toolbar(removing: .sidebarToggle)
        }
    }
}

#Preview {
    SearchView(searchText: .constant("Example"))
}
