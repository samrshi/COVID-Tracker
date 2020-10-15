//
//  NewsDetailView.swift
//  COVID
//
//  Created by hawkeyeshi on 8/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleModel
    
    var body: some View {
        ZStack {
            Color.backgroundDark
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text(self.article.title ?? "-")
                            .font(.system(Font.TextStyle.largeTitle, design: Font.Design.serif))
                            .fontWeight(.bold)
                            .layoutPriority(1)
                        
                        URLImage(url: self.article.urlToImage ?? "google.com")
                            .frame(width: geometry.size.width)
                            .cornerRadius(10)
                        
                        HStack {
                            Text("By")
                                .foregroundColor(.secondaryText)
                            
                            Text(self.article.author?.uppercased() ?? "-")
                                .foregroundColor(.primaryText)
                        }
                        
                        Text("Published at \(self.article.formattedDate)")
                            .font(.caption)
                            .foregroundColor(.secondaryText)
                            .padding(.bottom)
                        
                        Text(self.article.content ?? "-")
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(Text(article.source.name ?? "-"), displayMode: .inline)
    }
}
