//
//  ClimateCardView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ClimateCardView: View {
    let climateCard: ClimateCard
    
    var body: some View {
        ZStack {
            // MARK: - Card
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.colorTheme.cardBackground)
                .shadow(color: .colorTheme.cardShadow, radius: 40, x: 0, y: 20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                    
                }
            
            //MARK: - Content
            VStack(spacing: 10) {
                Image(systemName: climateCard.iconName)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.white)
                    .font(.title2.weight(.semibold))
                    .frame(width: 60, height: 60)
                    .background(LinearGradient([.colorTheme.temperatureRing1, .colorTheme.temperatureRing2], startPoint: .top, endPoint: .bottom))
                    .mask(Circle())
                
                VStack(spacing: 8.0) {
                    Text(climateCard.index)
                        .font(.headline)
                        
                    Text(climateCard.measure)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .opacity(0.6)
                }
                .foregroundColor(.white)
                
            }
            
        }
        .frame(width: 144, height: 164)
    }
}










struct ClimateCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClimateCardView(climateCard: previewClimateCard)
                .previewLayout(.sizeThatFits)
            ClimateCardView(climateCard: previewClimateCard)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding(50)
        .background(Color.colorTheme.background)
    }
}
