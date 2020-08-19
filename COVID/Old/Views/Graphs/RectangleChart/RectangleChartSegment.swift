//
//  RectangleChartSegment.swift
//  COVID
//
//  Created by hawkeyeshi on 7/25/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct RectangleChartSegment: View {
    let rect: CGRect
    let values: [Double]
    let index: Int
    
    let height: CGFloat
    
    let colors = [Color.green, Color.orange, Color.red]
    
    var total: Double {
        var sum: Double = 0
        for value in values {
            sum += value
        }
        return sum
    }
    
    var ratios: [CGFloat] {
        var result = [CGFloat]()
        for value in values {
            result.append(CGFloat(value / total))
        }
        return result
    }
    
    var startingXs: [CGFloat] {
        var result = [CGFloat]()
        result.append(rect.minX)
        
        for i in 1..<ratios.count {
            var x: CGFloat = 0
            for j in 0 ..< i {
                x += ratios[j]
            }
            result.append(rect.maxX * x)
        }
        return result
    }
    
    var path: Path {
        var path = Path()
        
        path.addRect(CGRect(x: startingXs[index],
                            y: rect.midY - (height / 2),
                            width: rect.maxX * ratios[index],
                            height: height))
        
        return path
    }
    
    var body: some View {
        path
            .fill(colors[index])
    }
}

extension Array where Element == Double {
    var sum: Double {
        var result: Double = 0
        for value in self {
            result += value
        }
        return result
    }
}

struct RectangleChartSegment_Previews: PreviewProvider {
    static var previews: some View {
        RectangleChartView(recovered: 20, active: 20, death: 6)
    }
}
