//
//  ThermometersSummaryView.swift
//  TermostatDemo
//
//  Created by Artem Paliutin on 26/04/2022.
//

import SwiftUI

struct ThermometersSummaryView: View {
    var status: Status
    var showStatus: Bool
    var temperature: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text(status.rawValue)
                .font(.headline)
                .foregroundColor(.white)
                .opacity(showStatus ? 0.6 : 0)
                .animation(.easeIn(duration: 0.5), value: showStatus)
            
            Text("\(temperature, specifier: "%.0f")")
                .font(.system(size: 54))
                .foregroundColor(.white)
            
            Image(systemName: "leaf.fill")
                .font(.title2.bold())
                .foregroundColor(.green)
        }
        .padding(.top, 40)
    }
}










struct ThermometersSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ThermometersSummaryView(status: .heating, showStatus: true, temperature: 22)
            .background(Color.colorTheme.innerDial2)
    }
}
