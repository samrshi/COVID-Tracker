//
//  ContentView.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var covidData = CovidData()
    @ObservedObject var newsData = NewsData()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    SectionTitle(
                        title: "Global Statistics",
                        image: Image("globe"),
                        backgroundColor: Color.backgroundLight
                    )
                    
                    GlobalStatsView().environmentObject(covidData)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("COVID-19 Headlines")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .scaledFont(size: 20)
                        
                        ForEach(newsData.newsData.articles, id: \.id) { article in
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
                                    .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                    .background(Color.backgroundLight)
                    .cornerRadius(20)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Covidity")
        }
    }
    
    init() {
        let coloredNavAppearance = UINavigationBarAppearance()
        let backgroundDark = UIColor(named: "backgroundDark")
        
        
        coloredNavAppearance.backgroundColor = backgroundDark
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UIScrollView.appearance().backgroundColor = backgroundDark
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
