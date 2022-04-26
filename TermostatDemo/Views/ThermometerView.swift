//
//  ThermometerView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ThermometerView: View {
    private let ringSize: CGFloat = 220
    
    @State private var ringValue: CGFloat = 0.5
    @State private var degrees: CGFloat = 36
    
    var body: some View {
        ZStack {
            // MARK: - Placeholder
            ThermometerPlaceholderView()
            
            // MARK: - Temperature Ring
            Circle()
                .inset(by: 5)
                .trim(from: 0.099, to: min(ringValue, 0.75))
                .stroke(LinearGradient([.colorTheme.temperatureRing1, .colorTheme.temperatureRing2]), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: ringSize, height: ringSize)
                .rotationEffect(.degrees(90))
                .animation(.linear(duration: 1), value: ringValue)
            
            // MARK: - Thermometer Dial
            ThermometerDialView(degrees: degrees)
        }
    }
}










struct ThermometerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThermometerView()
                .previewLayout(.sizeThatFits)
            ThermometerView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
