//
//  WeatherEntry.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import WidgetKit
import SwiftUI

struct WeatherEntry: TimelineEntry {
    public let date: Date
    public let weatherInfo: [Weather]
    
    var relevance: TimelineEntryRelevance? {
        return TimelineEntryRelevance(score: 100)
    }
}
