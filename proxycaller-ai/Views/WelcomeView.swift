//
//  WelcomeView.swift
//  proxycaller-ai
//
//  Created by Philip Daquin on 14/5/2024.
//

import Foundation
import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @StateObject
    var locationServices = LocationServices()
        
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Hello World")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text("Please share your current location")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation) {
                locationServices.getCurrentLocation()
            }
            .cornerRadius(10)
            .symbolVariant(.fill)
            .foregroundColor(.white)
           
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

#Preview {
    WelcomeView()
}
