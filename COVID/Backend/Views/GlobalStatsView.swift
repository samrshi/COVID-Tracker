//
//  GlobalStatsView.swift
//  Playground
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct GlobalStatsView: View {
    @EnvironmentObject var data: CovidData
    
    var body: some View {
        let currentGlobalData = data.globalData.results.prefix(1)
        
        return ForEach(currentGlobalData, id: \.id) { global in
            VStack {
                SectionTitle(
                    title: "Global Statistics",
                    image: Image("globe"),
                    backgroundColor: Color.backgroundLight
                )
                HStack {
                    VStack(alignment: .leading) {
                        if global.totalCases != -1 {
                            Text("\(global.totalCases)")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .scaledFont(size: 30)
                        } else {
                            Text("-")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .scaledFont(size: 30)
                        }
                        
                        Text("Confirmed Cases")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(Color.secondaryText)
                        
                        if global.totalDeaths != -1 {
                            Text("\(global.totalDeaths)")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .scaledFont(size: 30)
                        } else {
                            Text("-")
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .scaledFont(size: 30)
                        }
                        
                        Text("Deaths")
                            .font(.headline)
                            .foregroundColor(.secondaryText)
                    }
                    
                    Spacer()
                    
                    PieChartView(data: [global.totalDeaths, global.totalRecovered, global.totalActive], titles: ["Death", "Recovered", "Active"])
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}
