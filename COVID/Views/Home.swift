
//  Home.swift
//  COVID
//
//  Created by hawkeyeshi on 7/20/20.
//  Copyright © 2020 samrshi. All rights reserved.



import SwiftUI
import SwiftUICharts

let coloredNavAppearance = UINavigationBarAppearance()
let backgroundColor = UIColor(named: "background")

struct HomeView: View {
    @EnvironmentObject var historicCountry: HistoricCountryViewModel
    @EnvironmentObject var historicStates: HistoricalStatesViewModel
    @EnvironmentObject var userSettings: UserSettings
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 12) {
                    WarningCard()
                    
                    CountryCard()
                        .environmentObject(self.historicCountry)
                    
                    NavigationLink(destination: Text(userSettings.favoriteState)) {
                        StateCard(forState: userSettings.favoriteState, showSheet: $showSheet)
                            .environmentObject(self.historicStates)
                    }
                    
                    HStack {
                        GraphView(title: "United States", data: self.historicCountry.positiveOverAllDate, colorScheme: .cool)
                            .frame(height: 142)
                        
                        GraphView(title: stateMap[userSettings.favoriteState] ?? userSettings.favoriteState, data: self.historicStates.positiveOverDates(forState: userSettings.favoriteState), colorScheme: .warm)
                            .frame(height: 142)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .navigationBarTitle("COVID-19")
            .navigationBarItems(trailing: Button("Refresh") {
                self.historicCountry.loadData()
                self.historicStates.loadData()
            })
            .sheet(isPresented: $showSheet, content: {
                StatePickerView()
                    .environmentObject(self.userSettings)
                    .environmentObject(self.historicStates)
            })
        }
    }
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = backgroundColor
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        coloredNavAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        UIScrollView.appearance().backgroundColor = backgroundColor
    }
}

//struct HomeView_Previews: PreviewProvider {
//    let string = "NC"
//
//    static var previews: some View {
//        HomeView(favoriteState: $string).environment(\.colorScheme, .dark)
//    }
//}
