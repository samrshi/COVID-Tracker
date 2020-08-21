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
        let global = data.globalData
        
        return VStack(alignment: .leading) {
            SectionTitle(
                title: "Global Statistics",
                image: Image("globe"),
                backgroundColor: Color.backgroundLight
            )
            Text(global.formattedDate)
                .fontWeight(.semibold)
                .scaledFont(size: 15)
                .foregroundColor(.secondaryText)
                .padding(.vertical, -4)
            
            HStack {
                VStack(alignment: .leading) {
                    if global.cases != -1 {
                        Text("\(global.cases)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primaryText)
                            .scaledFont(size: 30)
                    } else {
                        Text("-")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primaryText)
                            .scaledFont(size: 30)
                    }
                    
                    Text("Confirmed Cases")
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(Color.secondaryText)
                    
                    if global.deaths != -1 {
                        Text("\(global.deaths)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primaryText)
                            .scaledFont(size: 30)
                    } else {
                        Text("-")
                            .foregroundColor(Color.primaryText)
                            .fontWeight(.semibold)
                            .scaledFont(size: 30)
                    }
                    
                    Text("Deaths")
                        .font(.headline)
                        .foregroundColor(.secondaryText)
                }
                
                Spacer()
                
                PieChartView(data: [global.deaths, global.recovered, global.active], titles: ["Death", "Recovered", "Active"])
                    .frame(width: 100, height: 100)
            }
        }
    }
}
