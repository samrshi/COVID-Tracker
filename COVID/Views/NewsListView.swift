//
//  NewsListView.swift
//  COVID
//
//  Created by hawkeyeshi on 8/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var newsData: NewsData
    
    let prefixSize: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top COVID-19 Headlines")
                .foregroundColor(.primaryText)
                .fontWeight(.bold)
                .scaledFont(size: 20)
            
            ForEach(newsData.newsData.articles.prefix(prefixSize), id: \.id) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    HStack {
                        URLImage(url: article.urlToImage ?? "google")
                            .cornerRadius(5)
                            .frame(width: 75, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(article.title ?? "-")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text(article.source.name ?? article.author ?? "-")
                                .scaledFont(size: 10)
                        }
                        .foregroundColor(.primaryText)
                        
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
