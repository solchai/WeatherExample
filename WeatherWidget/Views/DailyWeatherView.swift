//
//  DailyWeatherView.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct DailyWeatherView: View {
    let weather: Weather
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(weather.name.lowercased().contains("night") ? "\(weather.name.prefix(2)) 🌙" : weather.name.prefix(3))
            Text("\(weather.temperature) °\(weather.unit)")
            Text(WeatherUtil.getWeatherIcon(conditionString: weather.description)).padding(.top, 10)
        }.padding()
    }
}
