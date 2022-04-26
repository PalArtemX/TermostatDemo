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
    private let outerDialSize: CGFloat = 200
    
    @State private var currentTemp: CGFloat = 0
    @State private var degrees: CGFloat = 36
    @State private var showStatus = false
    
//    @State private var x: CGFloat = 0
//    @State private var y: CGFloat = 0
//    @State private var angle: CGFloat = 0
    
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
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
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
                .gesture(
                    DragGesture()
                        .onChanged ({ value in
                            let x = min(max(value.location.x, 0), outerDialSize)
                            let y = min(max(value.location.y, 0), outerDialSize)
//                            self.x = x
//                            self.y = y
                            
                            let endPoint = CGPoint(x: x, y: y)
                            let centrePoint = CGPoint(x: outerDialSize / 2, y: outerDialSize / 2)
                            
                            let angle = calcAngle(centerPoint: centrePoint, endPoint: endPoint)
//                            self.angle = angle
                            
                            if angle < 36 || angle > 270 { return }
                            degrees = angle - angle.remainder(dividingBy: 9)
                        })
                )
            
            // MARK: - Thermometer Summary
            ThermometersSummaryView(status: status, showStatus: showStatus, temperature: currentTemp)
        }
        .onAppear {
            currentTemp = 22
            degrees = currentTemp / 40 * 360
        }
        .onReceive(timer) { _ in
            switch status {
            case .heating:
                showStatus = true
                currentTemp += 1
            case .cooling:
                showStatus = true
                currentTemp -= 1
            case .reaching:
                showStatus = false
                break
            }
        }
        .onDisappear {
            timer.upstream.connect().cancel()
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

// MARK: - extension ThermometerView
extension ThermometerView {
    private func calcAngle(centerPoint: CGPoint, endPoint: CGPoint) -> CGFloat {
        let radians = atan2(endPoint.x - centerPoint.x , centerPoint.y - endPoint.y)
        let degrees = 180 + (radians * 180 / .pi)
        return degrees
    }
}
