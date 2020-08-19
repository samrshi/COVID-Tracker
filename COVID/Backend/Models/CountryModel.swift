//
//  CountryStatistics.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct CountryResults: Codable {
    let countrydata: [CountryModel]
    let stat: String
}

struct CountryModel: Codable {
    let id = UUID()
    
    let info: Info
    let totalCases: Int
    let totalRecovered: Int
    let totalUnresolved: Int
    let totalNewCasesToday: Int
    let totalNewDeathsToday: Int
    let totalActiveCases: Int
    let totalSeriousCases: Int
    
    struct Info: Codable {
        let title: String
        let code: String
        let source: String
    }
}

let emptyInfo = CountryModel.Info(title: "Unknown", code: "Unknown", source: "Unknown")

let emptyCountryData = CountryModel(info: emptyInfo, totalCases: -1, totalRecovered: -1, totalUnresolved: -1, totalNewCasesToday: -1, totalNewDeathsToday: -1, totalActiveCases: -1, totalSeriousCases: -1)

let emptyCountryResults = CountryResults(countrydata: [emptyCountryData], stat: "Unknown")
