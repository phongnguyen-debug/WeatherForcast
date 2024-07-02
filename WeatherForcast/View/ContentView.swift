//
//  ContentView.swift
//  WeatherForcast
//
//  Created by Pham Thi Thu Ha on 30/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocaltionManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                    .task {
                        do {
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView().environmentObject(locationManager)
                    }
            }
        }
        .background(Color(hue: 0.682, saturation: 0.692, brightness: 0.893))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
