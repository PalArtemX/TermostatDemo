//
//  ThermometerDialView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ThermometerDialView: View {
    private let outerDialSize: CGFloat = 200
    private let innerDialSize: CGFloat = 172
    private let setPointSize: CGFloat = 15
    var degrees: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient([.colorTheme.outerDial1, .colorTheme.outerDial2]))
                .frame(width: outerDialSize, height: outerDialSize)
                .shadow(color: .black.opacity(0.2), radius: 60, x: 0, y: 30)
                .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 8)
                .overlay {
                    Circle()
                        .stroke(LinearGradient([.white.opacity(0.2), .black.opacity(0.19)]), lineWidth: 1)
                }
                .overlay {
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 4)
                        .blur(radius: 8)
                        .offset(x: 3, y: 3)
                        .mask {
                            Circle()
                                .fill(LinearGradient([.black, .clear]))
                        }
                }
            
            Circle()
                .fill(LinearGradient([.colorTheme.innerDial1, .colorTheme.innerDial2]))
                .frame(width: innerDialSize, height: innerDialSize)
            
            Circle()
                .fill(LinearGradient([.colorTheme.temperatureSetPoint1, .colorTheme.temperatureSetPoint2]))
                .frame(width: setPointSize, height: setPointSize)
                .frame(width: innerDialSize, height: innerDialSize, alignment: .top)
                .offset(x: 0, y: 7.5)
                .rotationEffect(.degrees(degrees + 180))
                .animation(.easeInOut(duration: 1), value: degrees)
        }
    }
}










struct ThermometerDialView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThermometerDialView()
//                .previewLayout(.sizeThatFits)
//            ThermometerDialView()
//                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
