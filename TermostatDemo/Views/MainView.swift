//
//  MainView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                Color.colorTheme.background
                    .ignoresSafeArea()
                
                
                ScrollView {
                    // MARK: - Climate cards
                    VStack(spacing: 0.0) {
                        HStack(spacing: 20.0) {
                            ClimateCardView(climateCard: ClimateCard(iconName: "humidity.fill", index: "Inside", measure: "49%"))
                            
                            ClimateCardView(climateCard: ClimateCard(iconName: "thermometer", index: "Outside temp", measure: "-10°"))
                        }
                    }
                }
            }
    
            
            .navigationTitle("Thermostat")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
