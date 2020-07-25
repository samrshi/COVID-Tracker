//
//  PieChartTest.swift
//  COVID
//
//  Created by hawkeyeshi on 7/22/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct PieSlice {
    var id = UUID()
    var startDeg: Double
    var endDeg: Double
    var value: Int
    var normalizedValue: Double
}

struct PieChartTest: View {
    let data: [Int]
    
    var slices: [PieSlice] {
        var tempSlices: [PieSlice] = []
        var lastEndDeg: Double = 0
        let maxValue = data.reduce(0, +)
        for slice in data {
            let normalized: Double = Double(slice) / Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            let newSlice = PieSlice(startDeg: startDeg, endDeg: endDeg, value: slice, normalizedValue: normalized)
            tempSlices.append(newSlice)
        }
        return tempSlices
    }
    
    @State private var displayValue: Int? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(self.slices, id: \.id) { slice in
                    PieChartCell(rect: geometry.frame(in: .local), startDeg: slice.startDeg, endDeg: slice.endDeg)
                }
            }
        }    }
}

extension CGRect {
    var mid: CGPoint {
        CGPoint(x: self.midX, y: self.midY)
    }
}

struct PieChartTest_Previews: PreviewProvider {
    static var previews: some View {
        PieChartTest(data: [1, 2, 3, 4])
    }
}
