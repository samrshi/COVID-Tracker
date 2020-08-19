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
        self.totalCases - (self.totalRecovered + self.totalDeaths)
    }
}
