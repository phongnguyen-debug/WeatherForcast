//
//  WelcomeView.swift
//  WeatherForcast
//
//  Created by Pham Thi Thu Ha on 30/06/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocaltionManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome the weather forcast app")
                    .bold().font(.title)
                Text("Please share current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
