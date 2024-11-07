//
//  Themes.swift
//  hushh-ios
//
//  Created by Azhar Ali on 06/11/2024.
//

import SwiftUI


struct Theme {
    var backgroundColor: Color
    var primaryColor: Color
    var secondaryColor: Color
    var textColor: Color
    var dividerColor: Color
}


extension Theme {
    static let light = Theme(
        backgroundColor: Color(red: 255/255, green: 255/255, blue: 255/255),
        primaryColor: Color(red: 51/255, green: 51/255, blue: 51/255),
        secondaryColor: Color(red: 102/255, green: 102/255, blue: 102/255),
        textColor: Color(red: 0/255, green: 0/255, blue: 0/255),
        dividerColor: Color(red: 224/255, green: 224/255, blue: 224/255)
    )
    
    static let dark = Theme(
        backgroundColor: Color(red: 18/255, green: 18/255, blue: 18/255),
        primaryColor: Color(red: 255/255, green: 255/255, blue: 255/255),
        secondaryColor: Color(red: 179/255, green: 179/255, blue: 179/255),
        textColor: Color(red: 255/255, green: 255/255, blue: 255/255),
        dividerColor: Color(red: 51/255, green: 51/255, blue: 51/255)
    )
    
    static let greenOnBlack = Theme(
        backgroundColor: Color(red: 0/255, green: 0/255, blue: 0/255),
        primaryColor: Color(red: 0/255, green: 255/255, blue: 0/255),
        secondaryColor: Color(red: 0/255, green: 204/255, blue: 0/255),
        textColor: Color(red: 255/255, green: 0/255, blue: 255/255),
        dividerColor: Color(red: 51/255, green: 51/255, blue: 51/255)
    )
    
    static let earthy = Theme(
        backgroundColor: Color(red: 250/255, green: 243/255, blue: 224/255),
        primaryColor: Color(red: 93/255, green: 64/255, blue: 55/255),
        secondaryColor: Color(red: 121/255, green: 85/255, blue: 72/255),
        textColor: Color(red: 139/255, green: 195/255, blue: 74/255),
        dividerColor: Color(red: 215/255, green: 204/255, blue: 200/255)
    )

    static let blueWhite = Theme(
        backgroundColor: Color(red: 240/255, green: 248/255, blue: 255/255),
        primaryColor: Color(red: 0/255, green: 35/255, blue: 102/255),
        secondaryColor: Color(red: 0/255, green: 80/255, blue: 158/255),
        textColor: Color(red: 184/255, green: 134/255, blue: 11/255),
        dividerColor: Color(red: 176/255, green: 196/255, blue: 222/255)
    )

    static let mutedPastel = Theme(
        backgroundColor: Color(red: 245/255, green: 245/255, blue: 245/255),
        primaryColor: Color(red: 80/255, green: 80/255, blue: 80/255),
        secondaryColor: Color(red: 117/255, green: 117/255, blue: 117/255),
        textColor: Color(red: 200/255, green: 140/255, blue: 150/255),
        dividerColor: Color(red: 211/255, green: 211/255, blue: 211/255)
    )

    static let sunset = Theme(
        backgroundColor: Color(red: 254/255, green: 249/255, blue: 231/255),
        primaryColor: Color(red: 44/255, green: 62/255, blue: 80/255),
        secondaryColor: Color(red: 243/255, green: 156/255, blue: 18/255),
        textColor: Color(red: 231/255, green: 76/255, blue: 60/255),
        dividerColor: Color(red: 236/255, green: 240/255, blue: 241/255)
    )
}


class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme = .blueWhite
    
    func setTheme(_ theme: Theme) {
        currentTheme = theme
    }
}
