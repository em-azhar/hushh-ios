//
//  hushh_iosApp.swift
//  hushh-ios
//
//  Created by Azhar Ali on 06/11/2024.
//

import SwiftUI

@main
struct hushh_iosApp: App {
    @StateObject private var themeManager = ThemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView(themeName: "light")
                .environmentObject(themeManager)
        }
    }
}
