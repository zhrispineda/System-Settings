//
//  PrintersScannersView.swift
//  System Settings
//
//  System Settings > Printers & Scanners
//

import SwiftUI

struct PrintersScannersView: View {
    @State private var localization = LocalizationManager(bundleURL: URL(filePath: "/System/Library/ExtensionKit/Extensions/PrinterScannerSettings.appex"))
    @State private var selectedPaperSize = "US Letter"
    @State private var selectedPrinter = "PRINTER_LAST"
    let paperOptions = ["US Letter", "US Legal", "A4", "A5", "JIS B5", "B5", "Envelope #10", "Envelope DL", "Tabloid", "A3", "Tabloid Oversize", "ROC 16K", "Envelope Choukei 3", "Super B/A3"]
    let printerOptions = ["PRINTER_LAST"]
    
    var body: some View {
        CustomForm(title: "Printers & Scanners") {
            Section {
                Picker("DEFAULT_PRINTER".localized(using: localization), selection: $selectedPrinter) {
                    ForEach(printerOptions, id: \.self) { option in
                        Text(option.localized(using: localization))
                    }
                }
                Picker("DEFAULT_PAPER_SIZE".localized(using: localization), selection: $selectedPaperSize) {
                    ForEach(paperOptions, id: \.self) { option in
                        Text(option)
                    }
                }
            }
            
            Section {
                Text("NO_PRINTERS_AVAILABLE".localized(using: localization))
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            } footer: {
                HStack {
                    Spacer()
                    Button("ADD_PRINTER_ETC".localized(using: localization)) {}
                    HelpButton(topicID: "prtct004")
                }
            }
        }
    }
}

#Preview {
    PrintersScannersView()
}
