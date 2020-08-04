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
        ZStack(alignment: .top) {
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
            .blur(radius: showAlert ? 2 : 0)
            
<<<<<<< Updated upstream
            StateListView()
                .environmentObject(historicStates)
                .tabItem({Image(systemName: "location")})
        }
        .onAppear {
            self.historicCountry.loadData()
            self.historicStates.loadData()
=======
            VStack {
                CustomAlert(showAlert: $showAlert, alertTitle: $alertTitle, alertMessage: $alertMessage)
                
                Spacer()
            }
            .onTapGesture {
                withAnimation {
                    self.showAlert = false
                }
            }
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
                withAnimation {
                    self.showAlert = true
                }
            case .requestFailed:
                self.alertTitle = "Network problems"
                self.alertMessage = result.message
                withAnimation {
                    self.showAlert = true
                }
            case .unknown:
                self.alertTitle = "Unknown error"
                self.alertMessage = result.message
                withAnimation {
                    self.showAlert = true
                }
            case .invalidHTTPCode:
                self.alertTitle = "Invalid HTTP Request Code"
                self.alertMessage = result.message
                withAnimation {
                    self.showAlert = true
                }
            }
>>>>>>> Stashed changes
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
