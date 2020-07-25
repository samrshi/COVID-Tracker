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
        ZStack {
            Circle()
                .foregroundColor(Color("primary"))
            Circle()
                .foregroundColor(.white)
                .frame(width: 7, height: 7)
        }
        .frame(width: 14, height: 14)
        .shadow(radius: 5)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
    }
}
