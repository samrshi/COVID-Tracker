//
//  ArticleModel.swift
//  Playground
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct ArticleModel: Codable {
    let id = UUID()
    
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    struct Source: Codable {
        let id: String?
        let name: String?
    }
}
