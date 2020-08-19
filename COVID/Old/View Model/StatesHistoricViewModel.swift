//
//  StatesCurrentViewModel.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

//class StateWithPostiveData: Identifiable {
//    let id = UUID()
//
//    let name: String
//    var positiveData: [Double]
//
//    init(name: String, positiveData: [Double]) {
//        self.name = name
//        self.positiveData = positiveData
//    }
//}

class HistoricalStatesViewModel: ObservableObject {
//    @Published var statesOverDates: [StateWithPostiveData] = []
    @Published var states = [String : [Double]]()
    
    static let url = "https://covidtracking.com/api/v1/states/daily.json"
    // https://covidtracking.com/api/v1/states/daily.json
    
    init() {
        guard let url = URL(string: HistoricalStatesViewModel.url) else {
            print("Invalid URL")
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
                        
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let response = try JSONDecoder().decode([StateModel].self, from: data)
                        
                        for stateOnDate in response.reversed() {
                            if self.states.keys.contains(stateOnDate.state) {
                                self.states[stateOnDate.state]?.append(Double(stateOnDate.positive ?? 0))
                            } else {
                                self.states[stateOnDate.state] = [Double(stateOnDate.positive ?? 0)]
                            }
                        }
                    } catch let err {
                        print("Error: \(err)")
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
}


