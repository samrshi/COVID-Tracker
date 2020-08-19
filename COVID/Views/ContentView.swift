//
//  ContentView.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
<<<<<<< Updated upstream
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(historicCountry)
                .environmentObject(historicStates)
                .environmentObject(userSettings)
                .tabItem({Image(systemName: "house")})
            
            StateListView()
                .environmentObject(historicStates)
                .tabItem({Image(systemName: "location")})
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            self.historicCountry.fetchData(completion: self.handleResponse)
            self.historicStates.loadData(completion: self.handleResponse)
        }
    }
    
    func handleResponse(result: (message: String, result: Result<String, NetworkError>)) -> Void {
        switch result.result {
        case .success(_):
            // do nothing
            break
        case .failure(let error):
            switch error {
            case .badURL:
                self.alertTitle = "Bad URL"
                self.alertMessage = result.message
                self.showAlert = true
            case .requestFailed:
                self.alertTitle = "Network problems"
                self.alertMessage = result.message
                self.showAlert = true
            case .unknown:
                self.alertTitle = "Unknown error"
                self.alertMessage = result.message
                self.showAlert = true
            case .invalidHTTPCode:
                self.alertTitle = "Invalid HTTP Request Code"
                self.alertMessage = result.message
                self.showAlert = true
            }
        }
=======
    @ObservedObject var data = CovidData()
    @ObservedObject var news = NewsData()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ZStack {
                    Color.backgroundDark
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading) {
                        VStack {
                            SectionTitle(
                                title: "Global Statistics",
                                image: Image("globe"),
                                backgroundColor: Color.backgroundLight
                            )
                            
                            GlobalStatsView().environmentObject(data)
                        }
                        .padding(.vertical)
                        
                        VStack(alignment: .leading) {
                            Text("Latest News")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .scaledFont(size: 20)
                            
                            ForEach(news.newsData.articles, id: \.id) { article in
                                HStack {
                                    URLImage(url: article.urlToImage ?? "google")
                                        .cornerRadius(5)
                                    
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
                        }
                        .padding()
                        .background(Color.backgroundLight)
                        .cornerRadius(20)
                    }
                    .padding(.horizontal)
                }
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
>>>>>>> Stashed changes
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
