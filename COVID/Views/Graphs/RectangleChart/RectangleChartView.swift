//
//  RectangleChartView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/25/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct RectangleChartView: View {
    let recovered: Int
    let active: Int
    let death: Int
    
    var values: [Double] {
        [Double(recovered), Double(active), Double(death)]
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<self.values.count) { index in
                    RectangleChartSegment(rect: geometry.frame(in: .local), values: self.values, index: index, height: 8)
                }
            }
        }
    }
}

struct RectangleChartView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleChartView(recovered: 2, active: 1, death: 1)
    }
}
