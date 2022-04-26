//
//  ThermometerPlaceholderView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ThermometerPlaceholderView: View {
    private let placeholderSize: CGFloat = 244
    
    var body: some View {
        Circle()
            .fill(LinearGradient([.colorTheme.placeholder1, .colorTheme.placeholder2]))
            .frame(width: placeholderSize, height: placeholderSize)
            .shadow(color: .colorTheme.placeholderDropShadow, radius: 30, x: 0, y: 15)
            .overlay {
                Circle()
                    .stroke(LinearGradient([.blue.opacity(0.3), .white.opacity(0.1)]), lineWidth: 0.8)
            }
            .overlay {
                Circle()
                    .stroke(Color.colorTheme.placeholderInnerShadow, lineWidth: 2)
                    .blur(radius: 7)
                    .offset(x: 0, y: 3)
                    .mask {
                        Circle()
                            .fill(LinearGradient([.black, .clear], startPoint: .top, endPoint: .bottom))
                    }
            }
    }
}










struct ThermometerPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThermometerPlaceholderView()
                .previewLayout(.sizeThatFits)
            ThermometerPlaceholderView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding(50)
        .background(Color.colorTheme.background)
    }
}
