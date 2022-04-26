//
//  ThermometerView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ThermometerView: View {
    private let ringSize: CGFloat = 220
    private let minTemp: CGFloat = 4
    private let maxTemp: CGFloat = 30
    
    @State private var currentTemp: CGFloat = 0
    @State private var degrees: CGFloat = 36
    
    var targetTemp: CGFloat {
        return min(max(degrees / 360 * 40, minTemp), maxTemp)
    }
    var ringValue: CGFloat {
        return currentTemp / 40
    }
    var status: Status {
        if currentTemp < targetTemp {
            return .heating
        } else if currentTemp > targetTemp {
            return .cooling
        } else {
            return .reaching
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: - Thermometer Scale
            ThermometerScaleView()
            
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
            
            // MARK: - Thermometer Summary
            ThermometersSummaryView(status: status, showStatus: true, temperature: currentTemp)
        }
        .onAppear {
            currentTemp = 22
            degrees = currentTemp / 40 * 360
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
