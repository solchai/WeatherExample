//
//  WeatherView.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct WeatherView: View {
    let weather: Weather
    let updatedDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(weather.name)")
            Text("\(weather.temperature) °\(weather.unit)")
                .font(.largeTitle)
            Text(WeatherUtil.getWeatherIcon(conditionString: weather.description)).padding(.top, 10)
            Text(weather.description)
                .font(.footnote)
            HStack {
                Spacer()
                Text("Updated: \(updatedDate.timeOnly())")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray.opacity(1))
            }
        }.padding()
    }
}
