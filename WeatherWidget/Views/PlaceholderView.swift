//
//  PlaceholderView.swift
//  WeatherExample
//
//  Created by Solomon Chai on 2020-08-25.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.5777398768, blue: 0.8143981074, alpha: 1))
            VStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).frame(width: 80, height: 20)
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
