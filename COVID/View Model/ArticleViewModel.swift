//
//  ArticleViewModel.swift
//  COVID
//
//  Created by hawkeyeshi on 8/19/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

extension ArticleModel {
    var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "y-MM-d'T'hh:mm:s'Z'"
        let date = inputFormatter.date(from: self.publishedAt ?? "-") ?? Date()
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "mm/dd/y hh:m a"
        let result = outputFormatter.string(from: date)
        
        return result
    }
}
