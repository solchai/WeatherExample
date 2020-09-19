//
//  WeatherUtil.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct WeatherUtil {
    static func getWeatherIcon(conditionString: String) -> String {
        let current =  conditionString.lowercased()
        switch current {
        case _ where current.contains("partly sunny"):
            return "🍏"
        case _ where current.contains("cloudy"):
            return "🍎"
        case _ where current.contains("drizzle"):
            return "🍐"
        case _ where current.contains("sunny"):
            return "🍊"
        case _ where current.contains("clear"):
            return "🍋"
        default:
            return "🍌"
        }
    }
}

