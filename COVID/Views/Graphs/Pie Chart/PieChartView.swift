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

struct PieChartView: View {
    let data: [Int]
    let titles: [String]
    
    var slices: [PieSlice] {
        var tempSlices: [PieSlice] = []
        var lastEndDeg: Double = 0
        let maxValue = data.reduce(0, +)
        for slice in data {
            let normalized: Double = Double(slice) / Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            let newSlice = PieSlice(startDeg: startDeg + 1, endDeg: endDeg - 1, value: slice, normalizedValue: normalized)
            tempSlices.append(newSlice)
        }
        return tempSlices
    }
    
    @State private var displayValue = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.backgroundDark)
                
                ForEach(0 ..< self.slices.count, id: \.self) { index in
                    PieChartCell(rect: geometry.frame(in: .local), startDeg: self.slices[index].startDeg, endDeg: self.slices[index].endDeg, color: Color.rgbArray[index])
                }
                
                if self.displayValue {
                    VStack {
                        ForEach(0 ..< self.slices.count, id: \.self) { index in
                            HStack {
                                Text("\(self.titles[index]) \(Int(self.slices[index].normalizedValue * 100))%")
                                    .font(.caption)
                                    .foregroundColor(Color.rgbArray[index])
                            }
                        }
                    }
                    .transition(.scale)
                }
            }
            .onTapGesture {
                    withAnimation {
                        self.displayValue.toggle()
                    }
            }
        }
    }
}

extension CGRect {
    var mid: CGPoint {
        CGPoint(x: self.midX, y: self.midY)
    }
}

//struct PieChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        PieChartView(data: [1, 2, 3, 4], rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height: 10)))
//    }
//}
