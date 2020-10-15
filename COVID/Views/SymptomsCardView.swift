//
//  SymptomsCard.swift
//  COVID
//
//  Created by hawkeyeshi on 8/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct SymptomsCardView: View {
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("COVID-19")
                    .fontWeight(.bold)
                    .scaledFont(size: 20)
                    .foregroundColor(.primaryText)
                
                Spacer()
            }
            
            Text("Are you infected with COVID-19?")
                .fontWeight(.bold)
                .scaledFont(size: 17)
                .foregroundColor(.ternaryText)
            
            HStack {
                Image(systemName: "chart.bar.fill")
                    .scaledFont(size: 80)
                    .offset(x: -30)
                
                Spacer()
                                
                Text("Check out this list of the most common symptoms of COVID-19.")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondaryText)
                .scaledFont(size: 15)
            }
        }
        .padding()
        .background(Color.backgroundLight)
        .cornerRadius(10)
    }
}

struct SymptomsCardView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsCardView()
    }
}
