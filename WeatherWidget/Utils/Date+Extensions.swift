//
//  Date+Extensions.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import Foundation

extension Date {
    func timeOnly() -> String {
        let fromDate = self
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: fromDate)
    }
}
