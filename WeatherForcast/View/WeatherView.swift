//
//  WeatherView.swift
//  WeatherForcast
//
//  Created by Pham Thi Thu Ha on 30/06/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                        }
                        VStack(spacing: 20) {
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 50)
                    
                    AsyncImage(url: URL(string: "https://media.istockphoto.com/id/1294454411/vi/anh/bi%E1%BB%83u-t%C6%B0%E1%BB%A3ng-london-v%E1%BB%9Bi-big-ben-double-decker-buses-v%C3%A0-red-phone-booth-%E1%BB%9F-anh-v%C6%B0%C6%A1ng-qu%E1%BB%91c-anh.jpg?s=1024x1024&w=is&k=20&c=aqTMCdeoUnLK8psC1xN1zUpp3MaqmDS7ZBoJf5BzRUE=")) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 380)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(width: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.temp_min.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.temp_max.roundDouble() + "°")
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Max temp", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.682, saturation: 0.692, brightness: 0.893))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.682, saturation: 0.692, brightness: 0.893))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
