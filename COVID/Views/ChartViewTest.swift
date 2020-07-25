//
//  ChartView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ChartViewTest: View {
    var body: some View {
        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", legend: "Legendary")
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartViewTest()
    }
}