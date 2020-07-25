//
//  StateModel.swift
//  COVID
//
//  Created by hawkeyeshi on 7/17/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation


struct StateModel: Codable, Identifiable {
    let id = UUID()
    
    let date: Int
    let death: Int?
    let deathConfirmed: Int?
    let deathIncrease: Int?
    let deathProbable: Int?
    let fips: String
    let hospitalizedCumulative: Int?
    let hospitalizedCurrently: Int?
    let hospitalizedIncrease: Int?
    let inIcuCumulative: Int?
    let inIcuCurrently: Int?
    let negative: Int?
    let negativeTestsViral: Int?
    let onVentilatorCumulative: Int?
    let onVentilatorCurrently: Int?
    let pending: Int?
    let positive: Int?
    let positiveCasesViral: Int?
    let positiveIncrease: Int?
    let positiveTestsViral: Int?
    let recovered: Int?
    let state: String
    let totalTestResults: Int?
    let totalTestResultsIncrease: Int?
    let totalTestsViral: Int?
    
    var formattedDate: String {
        let getFormatter = DateFormatter()
        getFormatter.dateFormat = "yyyyMMdd"
        guard let newDate = getFormatter.date(from: "\(date)") else { return "Unknown" }
        
        let returnFormatter = DateFormatter()
        returnFormatter.dateFormat = "MMM dd"
        return returnFormatter.string(from: newDate)
    }
}

let stateMap = [
    "AL" : "Alabama",
    "AK" : "Alaska",
    "AZ" : "Arizona",
    "AR" : "Arkansas",
    "AS" : "American Samoa",
    "CA" : "California",
    "CO" : "Colorado",
    "CT" : "Connecticut",
    "DE" : "Delaware",
    "DC" : "District of Columbia",
    "FL" : "Florida",
    "GA" : "Georgia",
    "GU" : "Guam",
    "HI" : "Hawaii",
    "ID" : "Idaho",
    "IL" : "Illinois",
    "IN" : "Indiana",
    "IA" : "Iowa",
    "KS" : "Kansas",
    "KY" : "Kentucky",
    "LA" : "Louisiana",
    "ME" : "Maine",
    "MD" : "Maryland",
    "MA" : "Massachusetts",
    "MI" : "Michigan",
    "MN" : "Minnesota",
    "MS" : "Mississippi",
    "MO" : "Missouri",
    "MT" : "Montana",
    "NE" : "Nebraska",
    "NV" : "Nevada",
    "NH" : "New Hampshire",
    "NJ" : "New Jersey",
    "NM" : "New Mexico",
    "NY" : "New York",
    "NC" : "North Carolina",
    "ND" : "North Dakota",
    "OH" : "Ohio",
    "OK" : "Oklahoma",
    "OR" : "Oregon",
    "PA" : "Pennsylvania",
    "PR" : "Puerto Rico",
    "RI" : "Rhode Island",
    "SC" : "South Carolina",
    "SD" : "South Dakota",
    "TN" : "Tennessee",
    "TX" : "Texas",
    "UT" : "Utah",
    "VT" : "Vermont",
    "VA" : "Virginia",
    "VI" : "U.S. Virgin Islands",
    "WA" : "Washington",
    "WV" : "West Virginia",
    "WI" : "Wisconsin",
    "WY" : "Wyoming"
]

let emptyState = StateModel(date: -1, death: -1, deathConfirmed: -1, deathIncrease: -1, deathProbable: -1, fips: "", hospitalizedCumulative: -1, hospitalizedCurrently: -1, hospitalizedIncrease: -1, inIcuCumulative: -1, inIcuCurrently: -1, negative: -1, negativeTestsViral: -1, onVentilatorCumulative: -1, onVentilatorCurrently: -1, pending: -1, positive: -1, positiveCasesViral: -1, positiveIncrease: -1, positiveTestsViral: -1, recovered: -1, state: "", totalTestResults: -1, totalTestResultsIncrease: -1, totalTestsViral: -1)
