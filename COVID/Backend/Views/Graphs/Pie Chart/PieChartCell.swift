//
//  PieChartCell.swift
//  COVID
//
//  Created by hawkeyeshi on 7/25/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct PieChartCell: View {
    var rect: CGRect
    var radius: CGFloat {
        min(rect.width, rect.height) / 2
    }
    var startDeg: Double
    var endDeg: Double
    
    let color: Color
    
    var path: Path {
        var path = Path()
        
        path.addArc(center: rect.mid, radius: radius, startAngle: Angle(degrees: startDeg), endAngle: Angle(degrees: endDeg), clockwise: false)
//        path.addLine(to: rect.mid)
//        path.closeSubpath()
        
        return path
    }
    
    var body: some View {
        path
            .stroke(color, lineWidth: 5)
    }
}

struct PieChartCell_Previews: PreviewProvider {
    static var previews: some View {
        PieChartCell(rect: CGRect(x: 0, y: 0, width: 10, height: 10), startDeg: 0, endDeg: 0, color: Color.red)
    }
}
