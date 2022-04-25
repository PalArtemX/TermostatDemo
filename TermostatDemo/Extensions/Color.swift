//
//  Color.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 25/04/2022.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let background = Color("Background")
    let cardBackground = Color("Card Background")
    let cardShadow = Color("Card Shadow")
    let innerDial1 = Color("Inner Dial 1")
    let innerDial2 = Color("Inner Dial 2")
    let outerDial1 = Color("Outer Dial 1")
    let outerDial2 = Color("Outer Dial 2")
    let placeholder1 = Color("Placeholder 1")
    let placeholder2 = Color("Placeholder 2")
    let placeholderDropShadow = Color("Placeholder Drop Shadow")
    let placeholderInnerShadow = Color("Placeholder Inner Shadow")
    let scaleLine = Color("Scale Line")
    let temperatureRing1 = Color("Temperature Ring 1")
    let temperatureRing2 = Color("Temperature Ring 2")
    let temperatureSetPoint1 = Color("Temperature Set Point 1")
    let temperatureSetPoint2 = Color("Temperature Set Point 2")
}

extension Color {
    static var colorTheme = ColorTheme()
}
