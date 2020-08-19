//
//  ViewExtensions.swift
//  COVID
//
//  Created by hawkeyeshi on 7/20/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

extension View {
    func title() -> some View {
        self
            .font(.system(size: 17, weight: .bold, design: .default))
            .foregroundColor(Color(.secondaryLabel))
    }
    
    func subTitle() -> some View {
        self
            .font(.system(size: 12, weight: .regular, design: .default))
            .foregroundColor(Color(.label))
    }
    
    func card() -> some View {
        self
            .padding()
            .background(Color("cardBackground"))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}
