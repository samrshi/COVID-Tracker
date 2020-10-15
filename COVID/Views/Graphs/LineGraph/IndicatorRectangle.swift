//
//  IndicatorPoint.swift
//  COVID
//
//  Created by hawkeyeshi on 7/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct IndicatorRectangle: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("primary"), style: StrokeStyle(lineWidth: 1))
                .frame(width: 20)
        }
    }
}

struct IndicatorRectangle_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorRectangle()
    }
}
