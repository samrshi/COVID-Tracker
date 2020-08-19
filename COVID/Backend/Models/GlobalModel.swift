//
//  CountryStatistics.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct GlobalResults: Codable {
    let results: [GlobalModel]
    let stat: String
}

struct GlobalModel: Codable {
    let id = UUID()
    
    let totalCases: Int
    let totalRecovered: Int
    let totalUnresolved: Int
    let totalDeaths: Int
    let totalNewCasesToday: Int
    let totalNewDeathsToday: Int
    let totalSeriousCases: Int
    let totalAffectedCountries: Int
}

let emptyGlobalData = GlobalModel(totalCases: -1, totalRecovered: -1, totalUnresolved: -1, totalDeaths: -1, totalNewCasesToday: -1, totalNewDeathsToday: -1, totalSeriousCases: -1, totalAffectedCountries: -1)

let emptyGlobalResults = GlobalResults(results: [emptyGlobalData], stat: "empty")
