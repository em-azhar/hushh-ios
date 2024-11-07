//
//  ThemePickerView.swift
//  hushh-ios
//
//  Created by Azhar Ali on 06/11/2024.
//

import SwiftUI

struct ThemePickerView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var themeManager: ThemeManager
    
    let themes = [
        "light",
        "dark",
        "greenOnBlack",
        "earthy",
        "blueWhite",
        "mutedPastel",
        "sunset"
    ]
    @State var selectedTheme: String = "light"
    @Binding var themeName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("choose theme")
                .font(.system(size: 28, weight: .medium, design: .monospaced))
                .foregroundStyle(themeManager.currentTheme.primaryColor)
                .padding()
            List(themes, id: \.self) { theme in
                Button(action:{
                    selectedTheme = theme
                    themeName = theme
                    dismiss()
                }) {
                    HStack{
                        Text(theme)
                            .font(
                                .system(
                                    size: 20,
                                    weight: .regular,
                                    design: .monospaced
                                )
                            )
                            .foregroundStyle(
                                themeManager.currentTheme.textColor
                            )
                        Spacer()
                        if selectedTheme == theme {
                            Image(systemName: "checkmark")
                                .foregroundStyle(
                                    themeManager.currentTheme.textColor
                                )
                        }
                    }
                    .padding(.vertical, 7)
                }
                .listRowBackground(themeManager.currentTheme.backgroundColor)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
        .background(themeManager.currentTheme.backgroundColor)
        
    }
}

#Preview {
    ContentView(themeName: "blueWhite")
        .environmentObject(ThemeManager())
}
