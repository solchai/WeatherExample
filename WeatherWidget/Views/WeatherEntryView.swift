//
//  WeatherEntryView.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct WeatherEntryView: View {
    let entry: WeatherEntry
    private let darkColor = Color(#colorLiteral(red: 0, green: 0.5777398768, blue: 0.8143981074, alpha: 1))
    private let baseColor = Color(#colorLiteral(red: 0.9890514965, green: 0.7863666373, blue: 0.8143981074, alpha: 1))
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            ZStack {
                baseColor
                WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
            }.edgesIgnoringSafeArea(.all)
            
        case .systemMedium:
            ZStack {
                HStack(spacing: 0) {
                    Rectangle().fill(baseColor)
                    Rectangle().fill(darkColor)
                }
                HStack {
                    WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
                    //WeatherView(weather: entry.weatherInfo[1], updatedDate: entry.date)
                        .foregroundColor(.white)
                }
            }.edgesIgnoringSafeArea(.all)
            
        case .systemLarge:
            VStack {
                ZStack {
                    HStack(spacing: 0) {
                        Rectangle().fill(baseColor)
                        Rectangle().fill(darkColor)
                    }
                    HStack {
                        WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
                        WeatherView(weather: entry.weatherInfo[1], updatedDate: entry.date)
                            .foregroundColor(.white)
                    }
                }
                VStack {
                    HStack {
                        VStack {
                            DailyWeatherView(weather: entry.weatherInfo[2])
                            DailyWeatherView(weather: entry.weatherInfo[3])
                        }
                        VStack {
                            DailyWeatherView(weather: entry.weatherInfo[4])
                            DailyWeatherView(weather: entry.weatherInfo[5])
                        }
                        VStack {
                            DailyWeatherView(weather: entry.weatherInfo[6])
                            DailyWeatherView(weather: entry.weatherInfo[7])
                        }
                        VStack {
                            DailyWeatherView(weather: entry.weatherInfo[8])
                            DailyWeatherView(weather: entry.weatherInfo[9])
                        }
                    }
                }
            }
        default:
            ZStack {
                baseColor
                WeatherView(weather: entry.weatherInfo[0], updatedDate: entry.date)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

