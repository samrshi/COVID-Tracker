//
//  CountryStatistics.swift
//  Playground
//
//  Created by hawkeyeshi on 8/5/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct GlobalResults: Codable {
    let results: GlobalModel
    let stat: String
}

//struct GlobalModel: Codable {
//    let id = UUID()
//
//    let totalCases: Int
//    let totalRecovered: Int
//    let totalUnresolved: Int
//    let totalDeaths: Int
//    let totalNewCasesToday: Int
//    let totalNewDeathsToday: Int
//    let totalSeriousCases: Int
//    let totalAffectedCountries: Int
//}

struct GlobalModel: Codable {
    let id = UUID()
    
    let updated: Int
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Double
    let deathsPerOneMillion: Double
    let tests: Int
    let testsPerOneMillion: Double
    let affectedCountries: Int
}

let emptyGlobalModel = GlobalModel(updated: -1, cases: -1, todayCases: -1, deaths: -1, todayDeaths: -1, recovered: -1, active: -1, critical: -1, casesPerOneMillion: -1, deathsPerOneMillion: -1, tests: -1, testsPerOneMillion: -1, affectedCountries: -1)

let emptyGlobalResults = GlobalResults(results: emptyGlobalModel, stat: "empty")
