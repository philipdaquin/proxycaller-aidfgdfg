//
//  ContentView.swift
//  proxycaller-ai
//
//  Created by Philip Daquin on 13/5/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject
    var locationService = LocationServices()
    
    var weatherService = WeatherService()
    
    @State
    var weather: ResponseBody?

    
    var body: some View {
        VStack {
            
            if let location = locationService.location {
                if let currentWeather = weather {
                    Text("Weather is being fetched!")
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherService.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Unable to fetch your weather: \(error)")
                            }
                        }
                }
                Text("Your coordinates are: \(location.latitude), \(location.longitude)")
            } else {
                if locationService.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationService)
                }
            }
        }
        .background(Color(hue: 0.535, saturation: 0.722, brightness: 0.945))
        .preferredColorScheme(.light)
        
    }
}

#Preview {
    ContentView()
}
