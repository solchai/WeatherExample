//
//  ContentView.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct ContentView: View {
    @State var long: String = ""
    @State var lat: String = ""
    @State var showDetailIsHit: Bool = false
    @State var weatherDetail: WeatherDetail = WeatherDetail(long: "", lat: "")
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello, user!")
                .font(.title)
                .padding()
            Text("Enter long/lat and press Weather Detail to get the weather details")
                .font(.headline)
                .multilineTextAlignment(.center)
            TextField("Enter latitude", text: $lat).padding([.leading, .trailing])
            TextField("Enter longitude", text: $long).padding([.leading, .trailing])
            Button(action: {
                if long != "" && lat != "" {
                    showDetailIsHit = true
                    self.weatherDetail = WeatherDetail(long: long, lat: lat)
                }
            }) {
                Text("Show details")
            }
            Spacer()
            
            if showDetailIsHit {
                let weatherEntry = self.weatherDetail.getWeatherEntry()
                WeatherEntryView(entry: weatherEntry)
            }
        }
    }
}
