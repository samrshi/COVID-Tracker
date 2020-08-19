//
//  WarningCard.swift
//  COVID
//
//  Created by hawkeyeshi on 7/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct WarningCard: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                
                Text("Keep Yourself and Others Safe")
                
                Spacer()
            }
            .title()
            
            Text("Wear a mark, practice social distancing, and wash your hands frequently.")
                .subTitle()
                .frame(alignment: .leading)
        }
        .card()
    }
}

struct WarningCard_Previews: PreviewProvider {
    static var previews: some View {
        WarningCard()
    }
}
