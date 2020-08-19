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
        
        return GeometryReader { geometry in
            ForEach(currentGlobalData, id: \.id) { global in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
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
                        }
                        
                        VStack(alignment: .leading) {
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
                    }
                    
                    Spacer()
                                        
                    PieChartView(data: [global.totalCases, global.totalDeaths, global.totalRecovered])
                        .frame(width: 130, height: 130)
                }
            }
        }
    }
}
