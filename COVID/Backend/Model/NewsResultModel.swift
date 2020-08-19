//
//  NewsResultModel.swift
//  Playground
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct NewsResult: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

let emptyNewsResult = NewsResult(status: "unknown", totalResults: -1, articles: [Article(source: Article.Source(id: "unknown", name: "unknown"), author: "unknown", title: "unknown", description: "unknown", url: "unknownn", urlToImage: "unknown", publishedAt: "unknown", content: "unknown")])
