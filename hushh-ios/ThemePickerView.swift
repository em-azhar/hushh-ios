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
    @Binding var themeName: String
    
    
    var body: some View {
        let _currentTheme = themeManager.currentTheme
        VStack(alignment: .leading) {
            Text("choose theme")
                .font(.system(size: 28, weight: .medium, design: .monospaced))
                .foregroundStyle(_currentTheme.primaryColor)
                .padding()
            List(themes, id: \.self) { theme in
                Button(action:{
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
                                _currentTheme.textColor
                            )
                        Spacer()
                        if themeName == theme {
                            Image(systemName: "checkmark")
                                .foregroundStyle(
                                    _currentTheme.textColor
                                )
                        }
                    }
                    .padding(.vertical, 7)
                }
                .listRowBackground(_currentTheme.backgroundColor)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
        .background(_currentTheme.backgroundColor)
        .animation(.easeInOut(duration: 0.2), value: _currentTheme)
        
    }
}

#Preview {
    ContentView(themeName: "blueWhite")
        .environmentObject(ThemeManager(currentTheme: .light))
}
