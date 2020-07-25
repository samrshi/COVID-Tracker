//
//  CovidData.swift
//  COVID
//
//  Created by hawkeyeshi on 7/10/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

class CountryCurrentViewModel: ObservableObject {
    @Published var data: [CountryModel] = []
    
    static let url = "https://covidtracking.com/api/v1/us/current.json"
    // "https://covidtracking.com/api/v1/us/current.json"
    
    init() {
        data = []
        
        guard let url = URL(string: CountryCurrentViewModel.url) else {
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
                        self.data = try JSONDecoder().decode([CountryModel].self, from: data)
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


