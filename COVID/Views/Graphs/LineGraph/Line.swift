//
//  Line.swift
//  COVID
//
//  Created by hawkeyeshi on 7/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation
import SwiftUI

struct LineGraph: Shape {
    let data: [Int]
    
    var maxValue: Double {
        Double(data.max() ?? -1)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLines(getPoints(inRect: rect))
        return path
    }
    
    func getPoints(inRect rect: CGRect) -> [CGPoint] {
        var result = [CGPoint]()
        
        for i in 0..<data.count {
            if i != 0 {
                let x = getX(for: i, frameWidth: rect.maxX)
                let y = getY(for: data[i], frameHeight: rect.maxY)
                result.append(CGPoint(x: x, y: y))
            }
        }
        
        return result
    }
    
    func getX(for value: Int, frameWidth: CGFloat) -> CGFloat {
        let ratio = Double(value) / Double(data.count - 1)
        let y = frameWidth * CGFloat(ratio)
        
        return y
    }
    
    func getY(for value: Int, frameHeight: CGFloat) -> CGFloat {
        let ratio = Double(value) / Double(maxValue)
        let x = frameHeight - (frameHeight * CGFloat(ratio))
        
        return x
    }
}

struct Line: View {
    let data: [Int]
    
    var maxValue: Double {
        Double(data.max() ?? 0)
    }
    
    let showIndicator: Bool
    let touchLocation: CGPoint
    
    let colors: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LineGraph(data: self.data)
                    .stroke(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                    .padding(.vertical, 3)
                
                if(self.showIndicator) {
                    IndicatorRectangle()
                        .position(self.getClosestPointOnPath(touchLocation: self.touchLocation, width: geometry.size.width, height: geometry.size
                            .height, withY: false))
                    IndicatorPoint()
                        .position(self.getClosestPointOnPath(touchLocation: self.touchLocation, width: geometry.size.width, height: geometry.size
                            .height, withY: true))
                }
            }
        }
    }
    
    func getClosestPointOnPath(touchLocation: CGPoint, width: CGFloat, height: CGFloat, withY: Bool) -> CGPoint {
        let stepWidth = width / CGFloat(data.count - 1)
        
        let x = Int(touchLocation.x/stepWidth)
        
        var touchX: CGFloat {
            if touchLocation.x > width  {
                return width
            } else if touchLocation.x < 0 {
                return 0
            } else {
                return touchLocation.x
            }
        }
        
        var result: Double {
            if touchLocation.x > width {
                return Double(data[data.count - 1])
            } else if touchLocation.x < 0 {
                return Double(data[0])
            } else {
                return Double(data[x])
            }
        }
        
        let ratio = result / maxValue
        
        let calculatedY: CGFloat = height - height * CGFloat(ratio)
        
        let closest = CGPoint(x: touchX, y: withY ? calculatedY : height / 2)
        
        return closest
    }
}
