//
//  Weather.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import Foundation

struct Weather: Codable {
    let name: String
    let temperature: Int
    let unit: String
    let description: String
}
