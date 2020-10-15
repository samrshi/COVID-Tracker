//
//  GraphView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/18/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct LineGraphView: View {
    let title: String
    let data: [(date: String, positive: Int)]
    let colorScheme: GraphStyle
    
    @State private var currentValue: Int = 0
    @State private var currentDate: String = ""
    
    @State private var showingValue = false
    @State private var touchLocation: CGPoint = CGPoint(x: 0, y: 0)
        
    enum GraphStyle {
        case cool
        case warm
    }
    
    var colors: [Color] {
        if colorScheme == .cool {
            return [Color(#colorLiteral(red: 0.5549073815, green: 0.352668047, blue: 0.9707304835, alpha: 1)), Color(#colorLiteral(red: 0.2574616373, green: 0.7568748593, blue: 0.9734895825, alpha: 1))]
        } else {
            return [Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.backgroundDark)
                
                VStack {
                    HStack {
                        if self.showingValue {
                            Text("\(self.currentValue)")
                            
                            Spacer()
                            
                            Text(self.currentDate)
                                .foregroundColor(Color(UIColor.secondaryLabel))
//                                .subTitle()
                        } else {
                            Text(self.title)
                            Spacer()
                        }
                    }
//                    .title()
                    
                    Line(data: self.data.map({$0.positive}), showIndicator: self.showingValue, touchLocation: self.touchLocation, colors: self.colors)
                }
            }
            .gesture(DragGesture()
            .onChanged { value in
                self.currentValue = self.getClosestPositive(at: value.location.x, width: geometry.size.width)
                self.currentDate = self.getClosestDate(at: value.location.x, width: geometry.size.width)
                
                self.showingValue = true
                self.touchLocation = value.location
            }
            .onEnded { _ in
                self.showingValue = false
                }
            )
        }
        .padding(.horizontal, -10)
    }
    
    func getClosestPositive(at: CGFloat, width: CGFloat) -> Int {
        let stepWidth = width / CGFloat(data.count - 1)
        
        let x = Int(round((at)/stepWidth))
        
        var result: Int = 0
        
        if x > data.count - 1 {
            result = data[data.count - 1].positive
        } else if x < 0 {
            result = data[0].positive
        } else {
            result = data[x].positive
        }
        
        return result
    }
    
    func getClosestDate(at: CGFloat, width: CGFloat) -> String {
        let stepWidth = width / CGFloat(data.count - 1)
        
        let x = Int(round((at)/stepWidth))
        
        var result: String = ""
        
        if x > data.count - 1 {
            result = data[data.count - 1].date
        } else if x < 0 {
            result = data[0].date
        } else {
            result = data[x].date
        }
        return result
    }
}

struct LineGraphView2_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView(title: "Example", data: [(date: "01", positive: 1), (date: "02", positive: 2), (date: "02", positive: 2), (date: "03", positive: 3)], colorScheme: .cool)
    }
}
