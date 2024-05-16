//
//  WeatherView.swift
//  proxycaller-ai
//
//  Created by Philip Daquin on 15/5/2024.
//

import SwiftUI

struct WeatherView: View {
    
    
    var weather: ResponseBody;
    var mainImage = URL(string: "https://wallpapers.com/images/hd/cloudy-new-york-city-drone-shot-8fjzk8mz5cojbxxu.jpg")
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            VStack() {
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("today is, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud").font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                            
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feels_like.roundDouble() + "C")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: mainImage) {
                        image in image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
            
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, content: {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "MAX Temperature", value: (weather.main.temp_max.roundDouble() + "C"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Min Temperature", value: (weather.main.temp_min.roundDouble() + "C"))
                    }
                    HStack {
                        WeatherRow(logo: "thermometer", name: "MAX Temperature", value: (weather.main.temp_max.roundDouble() + "C"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Min Temperature", value: (weather.main.temp_min.roundDouble() + "C"))
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 30)
                .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0))
                .background(.white)
                .cornerRadius(23, corners: [.topRight, .topLeft])
            }        })
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.253, saturation: 0.807, brightness: 0.822))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
