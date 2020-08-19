//
//  RectangleCard.swift
//  COVID
//
//  Created by hawkeyeshi on 7/25/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct RectangleCard: View {
    @EnvironmentObject var historicCountry: HistoricCountryViewModel
    
    var body: some View {
        ForEach(historicCountry.historicData.prefix(1)) { country in
            VStack {
                RectangleChartView(recovered: country.recovered ?? 0, active: country.active, death: country.death ?? 0)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(country.recovered ?? 0)")
                            .foregroundColor(.primary)
                            .font(.system(size: 17))
                        Text("Recovered")
                            .font(.system(size: 10))
                            .foregroundColor(Color("primary"))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("\(country.active)")
                            .foregroundColor(.primary)
                            .font(.system(size: 17))
                        Text("Active")
                            .font(.system(size: 10))
                            .foregroundColor(Color("primary"))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("\(country.death ?? 0)")
                            .foregroundColor(.primary)
                            .font(.system(size: 17))
                        Text("Deaths")
                            .font(.system(size: 10))
                            .foregroundColor(Color("primary"))
                    }
                }
            }
        }
        .card()
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
