//
//  PercentChangeView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct PercentChangeView: View {
    var oppositeStyling: Bool
    
    var current: Double?
    var previous: Double?
    
    var percent: Int?
    
    private var percentChange: Int? {
        if let current = current, let previous = previous {
            return Int(((current - previous) / previous) * 100)
        } else if let percent = percent {
            return percent
        }
        return nil
    }

    var isPositive: Bool {
        if oppositeStyling {
            return !((percent ?? -1) >= 0)
        }
        return (percent ?? -1) >= 0
    }
    
    init(current: Double?, previous: Double?, oppositeStyling: Bool) {
        self.current = current
        self.previous = previous
        self.oppositeStyling = oppositeStyling
    }
    
    init(percent: Int?, oppositeStyling: Bool) {
        self.percent = percent
        self.oppositeStyling = oppositeStyling
    }
    
    var body: some View {
        HStack(spacing: 3) {
            image
                .font(.system(size: 15, weight: .bold, design: .default))
            
            Text(percentChange != nil ? "\(abs(percentChange!))%" : "-%")
                .foregroundColor(Color("primary"))
                .font(.system(size: 15))
        }
    }
    
    var image: some View {
        if percent ?? -1 > 0 {
            return Image(systemName: "arrow.up")
                .foregroundColor(oppositeStyling ? .green : .red)
        } else if percent ?? -1 < 0 {
            return Image(systemName: "arrow.down")
                .foregroundColor(oppositeStyling ? .red : .green)
        }
        return Image(systemName: "minus")
            .foregroundColor(.blue)
    }
}

struct PercentChangeView_Previews: PreviewProvider {
    static var previews: some View {
        PercentChangeView(percent: 0, oppositeStyling: false)
    }
}
