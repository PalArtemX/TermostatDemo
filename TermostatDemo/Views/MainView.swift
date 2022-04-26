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
                
                // MARK: -
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
