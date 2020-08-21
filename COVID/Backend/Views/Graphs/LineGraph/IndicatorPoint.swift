//
//  IndicatorPoint.swift
//  COVID
//
//  Created by hawkeyeshi on 7/20/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct IndicatorPoint: View {
    var body: some View {
        Circle()
            .foregroundColor(.primaryText)
            .frame(width: 10, height: 10)
            .shadow(radius: 5)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
    }
}
