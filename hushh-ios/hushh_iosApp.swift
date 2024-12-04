//
//  hushh_iosApp.swift
//  hushh-ios
//
//  Created by Azhar Ali on 06/11/2024.
//

import SwiftUI

@main
struct hushh_iosApp: App {
    @StateObject private var themeManager = ThemeManager(currentTheme: .light)
    var body: some Scene {
        WindowGroup {
            ContentView(themeName: UserDefaults.standard.string(forKey: "selectedTheme") ?? "light")
                .environmentObject(themeManager)
        }
    }
}
