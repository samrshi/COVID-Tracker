//
//  CountryHistoricViewModel.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

class HistoricCountryViewModel: ObservableObject {
    @Published var historicData: [CountryModel] = []
    @Published var positiveOverAllDate = [(date: String, positive: Int)]()
    
    static let url = "https://covidtracking.com/api/v1/us/daily.json"
    // "https://covidtracking.com/api/v1/us/daily.json"
    
    func loadData() {
        historicData = []
        positiveOverAllDate = []
        
        guard let url = URL(string: HistoricCountryViewModel.self.url) else {
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
                        self.historicData = try JSONDecoder().decode([CountryModel].self, from: data)
                        
                        for date in self.historicData.reversed() {
                            self.positiveOverAllDate.append(
                                (date: date.formattedDate, positive: date.positive ?? 0)
                            )
                        }
                    } catch let err {
                        print(err)
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
}

extension HistoricCountryViewModel {
    var positivePercentChange: Int {
        let current = Double(historicData[0].positive ?? 0)
        let previous = Double(historicData[1].positive ?? 1)
        
        let percentChange = ((current - previous) / previous) * 100
        
        return Int(percentChange)
    }
    
    var deathPercentChange: Int {
        let current = Double(historicData[0].death ?? 0)
        let previous = Double(historicData[1].death ?? 1)
        
        let percentChange = ((current - previous) / previous) * 100
        
        return Int(percentChange)
    }
    
    var activePercentDifference: Int {
        let current = Double(historicData[0].active)
        let previous = Double(historicData[1].active)
                
        let percentDifference: Double = ((current - previous) / previous) * 100
        
        return Int(percentDifference)
    }
    
    var recoveredPercentDifferent: Int {
        let current = Double(historicData[0].recovered ?? 0)
        let previous = Double(historicData[1].recovered ?? 1)
                
        let percentDifference: Double = ((current - previous) / previous) * 100

        return Int(percentDifference)
    }
    
    var positiveIncreasePercentDifference: Int {
        let current = Double(historicData[0].positiveIncrease ?? 0)
        let previous = Double((historicData[1].positiveIncrease ?? 1))
                
        let percentChange: Double = ((current - previous) / previous) * 100
                
        return Int(percentChange)
    }
    
    var deathIncreasePercentDifference: Int {
        let current = Double((historicData[0].deathIncrease ?? 0))
        let previous = Double((historicData[1].deathIncrease ?? 1))
                
        let percentChange: Double = ((current - previous) / previous) * 100
                
        return Int(percentChange)
    }
}
