//
//  WeatherService.swift
//  proxycaller-ai
//
//  Created by Philip Daquin on 14/5/2024.
//

import Foundation

import CoreLocation


struct CoordinatesResponse: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherResponse: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct MainResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct WindResponse: Decodable {
    var speed: Double
    var deg: Int
}

struct CloudsResponse: Decodable {
    var all: Int
}

struct SysResponse: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var base: String
    var main: MainResponse
    var visibility: Int
    var wind: WindResponse
    var clouds: CloudsResponse
    var dt: Int
    var sys: SysResponse
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}


class WeatherService {
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        
        print("fetching current weather now")
        
        let APIKEY  = "52251dfb88366f66a750e3bf0caf255c"
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(APIKEY)&units=metric"
        
        // Use guard to ensure the response is valid
        guard let url = URL(string: url) else { fatalError("Invalid URL")}
        
        let (data, resp) = try await URLSession.shared.data(from: url)
        
        // Use guard to ensure the response is a valid HTTP response with 200 status code
        guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let weatherData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return weatherData
    }
}

