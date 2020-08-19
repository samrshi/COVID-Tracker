//
//  SectionTitleView.swift
//  Playground
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    let image: Image?
    let backgroundColor: Color
    
    init(title: String, image: Image? = nil, backgroundColor: Color) {
        self.title = title
        self.image = image
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        HStack {
            HStack {
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                
                Text(title)
                    .fontWeight(.bold)
            }
            .scaledFont(size: 20)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
        }
    }
}

struct SectionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "Global Statistics", image: Image(systemName: "globe"), backgroundColor: Color.backgroundLight)
    }
}
