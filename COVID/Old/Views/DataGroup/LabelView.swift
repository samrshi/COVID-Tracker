//
//  LabelView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct LabelView: View {
    var number: Int?
    var label: String
    
    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .leading) {
                    Text(number != nil && number != -1 ? "\(number!)" : "-")
                        .font(.system(size: 17))
                        .foregroundColor(.primary)
                    Text(label)
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 10))
                }
            }
            Spacer()
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(number: 3000000, label: "Confirmed")
    }
}
