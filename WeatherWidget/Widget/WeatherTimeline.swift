//
//  WeatherTimeline.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import WidgetKit
import SwiftUI

struct WeatherTimeline: TimelineProvider {
    typealias Entry = WeatherEntry
    
    func snapshot(with context: Context, completion: @escaping (WeatherEntry) -> ()) {
        var weatherSnap = [Weather]()
        
        for i in 0...9 {
            weatherSnap.append(Weather(name: "SF Day\(i)", temperature: 10 * i, unit: "F", description: "Cloudy"))
        }
        
        let entry = WeatherEntry(date: Date(), weatherInfo: weatherSnap)
        completion(entry)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        
        WeatherService().getWeather { (result) in
            let weatherInfo: [Weather]
            
            if case .success(let fetchedData) = result {
                weatherInfo = fetchedData
            } else {
                let errorWeather = Weather(name: "SF", temperature: 0, unit: "F", description: "Error")
                weatherInfo = [errorWeather, errorWeather]
            }
            
            let entry = WeatherEntry(date: currentDate, weatherInfo: weatherInfo)
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}
