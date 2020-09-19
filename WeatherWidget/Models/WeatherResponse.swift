//
//  WeatherResponse.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import Foundation

struct WeatherResponse: Codable {
    let forecast: [Weather]
}
