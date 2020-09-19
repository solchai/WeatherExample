//
//  WeatherDetail.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

class WeatherDetail {
    let long: String
    let lat: String
    let url: URL?
    
    init(long: String, lat: String) {
        self.long = long
        self.lat = lat
        self.url = URL( string: "https://api.lil.software/weather?latitude=\(lat)&longitude=\(long)")
    }
    
    func getWeather(completion: @escaping (Result<[Weather], Error>) -> Void) {
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(self.getWeatherResponse(fromData: data!)))
            }
        }.resume()
    }
    
    private func getWeatherResponse(fromData data: Data) -> [Weather] {
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        if let weatherD = weatherData {
            return weatherD.forecast
        }
        return [Weather(name: "Error", temperature: 0, unit: "", description: "Error")]
    }
    
    func getWeatherEntry() -> WeatherEntry {
        let currentDate = Date()
        var entry: WeatherEntry?
        
        self.getWeather { (result) in
            let weatherInfo: [Weather]
            
            if case .success(let fetchedData) = result {
                weatherInfo = fetchedData
            } else {
                let errorWeather = Weather(name: "SF", temperature: 0, unit: "F", description: "Error")
                weatherInfo = [errorWeather, errorWeather]
            }
            entry = WeatherEntry(date: currentDate, weatherInfo: weatherInfo)
        }
        guard let weatherEntry = entry else {
            return WeatherEntry(date: currentDate, weatherInfo: [Weather(name: "pooper", temperature: 0, unit: "c", description: "pooper")])
        }
        return weatherEntry
    }
}
