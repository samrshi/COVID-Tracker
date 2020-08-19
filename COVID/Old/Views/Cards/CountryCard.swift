//
//  CountryCard.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CountryCard: View {
    @EnvironmentObject var currentCountry: HistoricCountryViewModel
    
    var body: some View {
        ForEach(self.currentCountry.historicData.prefix(1)) { country in
            VStack(spacing: 10) {
                HStack {
                    Text("United States")
                        .title()
                    
                    Spacer()
                }
                
                HStack {
                    DataGroupView(number: country.positive, label: "Confirmed", percentChange: self.currentCountry.positivePercentChange)
                    
                    DataGroupView(number: country.positiveIncrease, label: "New Cases", percentChange: self.currentCountry.positiveIncreasePercentDifference)
                }
                
                HStack {
                    DataGroupView(number: country.death, label: "Deaths", percentChange: self.currentCountry.deathPercentChange)
                    
                    DataGroupView(number: country.deathIncrease, label: "New Deaths", percentChange: self.currentCountry.deathIncreasePercentDifference)
                }
                
                HStack {
                    DataGroupView(number: country.active, label: "Active", percentChange: self.currentCountry.activePercentDifference)
                    
                    DataGroupView(number: country.recovered, label: "Recovered", percentChange: self.currentCountry.recoveredPercentDifferent, oppositeStyling: true)
                }
            }
        }
        .card()
    }
}

struct CountryCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            CountryCard()
        }
    }
}
