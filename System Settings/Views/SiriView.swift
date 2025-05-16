//
//  SiriView.swift
//  System Settings
//
//  System Settings > Siri
//  System Settings > Apple Intelligence & Siri
//

import SwiftUI

struct SiriView: View {
    var body: some View {
        CustomForm(title: "Apple Intelligence & Siri") {
            Section {
                HStack(alignment: .top, spacing: 15) {
                    IconView("Apple Intelligence & Siri", color: .white)
                        .symbolRenderingMode(.multicolor)
                        .scaleEffect(1.3)
                        .overlay {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .foregroundStyle(.black)
                                Text("BETA")
                                    .font(.system(size: 7))
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 25, height: 10)
                            .offset(x: 8, y: 10)
                        }
                    VStack(alignment: .leading) {
                        Text("Apple Intelligence & Siri")
                        Text("\("A personal intelligence system integrated deeply into your Mac, apps, and Siri.") [\("Learn More…")](help:anchor=mchl46361784)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .offset(y: -6)
                }
                .padding([.leading, .top, .trailing], 6)
                .padding(.bottom, -6)
            }
        }
    }
}

#Preview {
    SiriView()
}
