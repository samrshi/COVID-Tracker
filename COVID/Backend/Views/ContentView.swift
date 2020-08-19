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
                    GlobalStatsView().environmentObject(covidData)
                        .padding(.bottom)
                    
                    NewsListView(prefixSize: 5).environmentObject(newsData)
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
