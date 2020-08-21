//
//  GlobalViewModel.swift
//  COVID
//
//  Created by hawkeyeshi on 8/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

extension GlobalModel {
    var totalActive: Int {
//        self.totalCases - (self.totalRecovered + self.totalDeaths)
        self.active
    }
    
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(Double(self.updated) / 1000.0))
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM dd, y 'at' h:mm a z"
        let result = outputFormatter.string(from: date)
        
        return result
    }
}
