//
//  WeatherWidget.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI
import WidgetKit

@main
struct WeatherWidget: Widget {
    private var kind: String = "WeatherWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WeatherTimeline(), placeholder: PlaceholderView()) { entry in
            WeatherEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("SF WeatherWidget")
        .description("This widget displays current weather for SF")
    }
}
