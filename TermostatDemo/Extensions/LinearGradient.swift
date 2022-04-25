//
//  LinearGradient.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import Foundation
import SwiftUI


extension LinearGradient {
    init(_ colors: [Color], startPoint: UnitPoint = .topLeading, endPoint: UnitPoint = .bottomTrailing) {
        self.init(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
    }
}
