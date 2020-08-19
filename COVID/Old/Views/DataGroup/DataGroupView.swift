//
//  GroupView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct DataGroupView: View {
    let number: Int?
    let label: String
    let percentChange: Int?
    
    var oppositeStyling = false
    
    init(number: Int?, label: String, percentChange: Int?) {
        self.number = number
        self.label = label
        self.percentChange = percentChange
    }
    
    init(number: Int?, label: String, percentChange: Int?, oppositeStyling: Bool) {
        self.number = number
        self.label = label
        self.percentChange = percentChange
        self.oppositeStyling = oppositeStyling
    }
    
    var body: some View {
        HStack(spacing: 10) {
            PercentChangeView(percent: percentChange, oppositeStyling: oppositeStyling)
                .frame(width: 60)
            
            LabelView(number: number, label: label)
                .frame(width: 90)
        }
    }
}

struct DataGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DataGroupView(number: 100, label: "Confirmed", percentChange: 20)
    }
}
