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
    @Published var states = [String : [StateModel]]()
    @Published var statesArray = [emptyState]
    
    static let url = "https://covidtracking.com/api/v1/states/daily.json"
    // https://covidtracking.com/api/v1/states/daily.json
    
    func loadData(completion: @escaping ((message: String, result: Result<String, NetworkError>)) -> Void) {
        states = [String : [StateModel]]()
        statesArray = [emptyState]
        
        guard let url = URL(string: HistoricalStatesViewModel.url) else {
            print("Invalid URL")
            completion((message: "Invalid URL", result: .failure(.badURL)))
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion((message: error.localizedDescription, result: .failure(.requestFailed)))
                return
            }
                        
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                DispatchQueue.main.sync {
                    do {
                        let response = try JSONDecoder().decode([StateModel].self, from: data)
                        
                        self.states = [String : [StateModel]]()
                        self.statesArray = []
                        
                        for stateOnDate in response {
                            if self.states.keys.contains(stateOnDate.state) {
                                self.states[stateOnDate.state]?.append(stateOnDate)
                            } else {
                                self.states[stateOnDate.state] = [stateOnDate]
                                self.statesArray.append(stateOnDate)
                            }
                        }
                        completion((message: "Data fetched", result: .success("Success")))
                    } catch let err {
                        print("Error: \(err)")
                        completion((message: err.localizedDescription, result: .failure(.unknown)))
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
                completion((message: "HTTPRequest Code: \(response.statusCode)", result: .failure(.invalidHTTPCode)))
            }
        }.resume()
    }
}

extension HistoricalStatesViewModel {
    func positivePercentChange(forState: String) -> Int? {
        guard let current = states[forState]?[0].positive, let previous = states[forState]?[1].positive else {
            return nil
        }
        
        if (current == 0 || previous == 0) {
            return current
        }

        let percentChange: Double = (Double(current - previous) / Double(previous)) * 100
        
        return Int(percentChange)
    }
    
    func deathPercentChange(forState: String) -> Int? {
        guard let current = states[forState]?[0].death, let previous = states[forState]?[1].death else {
            return nil
        }
        
        if (current == 0 || previous == 0) {
            return current
        }

        let percentChange: Double = (Double(current - previous) / Double(previous)) * 100
        
        return Int(percentChange)
    }
    
    func positiveOverDates(forState: String) -> [(date: String, positive: Int)] {
        var result = [(date: String, positive: Int)]()
        
        for state in states[forState]?.reversed() ?? [emptyState] {
            result.append((date: state.formattedDate, positive: state.positive ?? 0))
        }
        
        return result
    }
}
