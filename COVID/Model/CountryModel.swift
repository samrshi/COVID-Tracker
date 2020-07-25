//
//  Response.swift
//  COVID
//
//  Created by hawkeyeshi on 7/8/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation
import SwiftUI


struct CountryModel: Codable, Identifiable {
    let id: UUID = UUID()
    
    let date: Int
    let dateChecked: String
    let death: Int?
    let deathIncrease: Int?
    let hash: String
    let hospitalized: Int?
    let hospitalizedCumulative: Int?
    let hospitalizedCurrently: Int?
    let hospitalizedIncrease: Int?
    let inIcuCumulative: Int?
    let inIcuCurrently: Int?
    let negative: Int?
    let onVentilatorCumulative: Int?
    let onVentilatorCurrently: Int?
    let pending: Int?
    let positive: Int?
    let positiveIncrease: Int?
    let recovered: Int?
    let states: Int
    
    var active: Int {
        (positive ?? 1) - (death ?? 1) - (recovered ?? 1)
    }
    
    var formattedDate: String {
        let getFormatter = DateFormatter()
        getFormatter.dateFormat = "yyyyMMdd"
        guard let newDate = getFormatter.date(from: "\(date)") else { return "Unknown" }
        
        let returnFormatter = DateFormatter()
        returnFormatter.dateFormat = "MMM dd"
        return returnFormatter.string(from: newDate)
    }
}
