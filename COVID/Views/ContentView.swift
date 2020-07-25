//
//  ContentView.swift
//  COVID
//
//  Created by hawkeyeshi on 7/8/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @ObservedObject var historicCountry = HistoricCountryViewModel()
    @ObservedObject var historicStates = HistoricalStatesViewModel()
    @ObservedObject var userSettings = UserSettings()
    
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
        .onAppear {
            self.historicCountry.loadData()
            self.historicStates.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
