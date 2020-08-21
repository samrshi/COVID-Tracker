//
//  Data.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

class CovidData: ObservableObject {
//    @Published var globalData: GlobalResults = emptyGlobalResults
    @Published var globalData: GlobalModel = emptyGlobalModel
    @Published var countryData: CountryResults = emptyCountryResults
    
    init() {
//        let globalDataURL = "https://api.thevirustracker.com/free-api?global=stats"
        let globalDataURL = "https://corona.lmao.ninja/v2/all"
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        API.fetch(type: GlobalModel.self, urlString: globalDataURL, decodingStrategy: .useDefaultKeys) { result in
            switch result {
            case .success(let data):
                self.globalData = data
            case .failure(_):
                break
            }
        }
        
        let urlTwo = "https://api.thevirustracker.com/free-api?countryTotal=US"
        
        dispatchGroup.enter()
        API.fetch(type: CountryResults.self, urlString: urlTwo, decodingStrategy: .convertFromSnakeCase) { result in
            switch result {
            case .success(let data):
                self.countryData = data
            case .failure(_):
                break
            }
        }
    }
}
