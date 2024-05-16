//
//  WeatherRow.swift
//  proxycaller-aidfgdfg
//dfgdfg
//  Created by Philip Daqdfgdfguin on 16/5/2024.
//

import SwiftUI

struct WeatherRow: View {
    
    var logo: String
    var name: String
    var value: String
    
    
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(systemName: logo)
                .font(.title)
                .frame(width: 20, height: 20)
                .padding()
                .background()
                .cornerRadius(50)
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }

        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8")
}
