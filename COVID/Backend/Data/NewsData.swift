//
//  NewsData.swift
//  Playground
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

let key = "0681983eba5a4325af53378169f48daa"

class NewsData: ObservableObject {
    @Published var newsData: NewsResult = emptyNewsResult
    
    init() {
//        let urlOne = "https://newsapi.org/v2/top-headlines?country=us&q=coronavirus&apiKey=0681983eba5a4325af53378169f48daa"
        let urlOne = "https://newsapi.org/v2/everything?q=covid-19&from=2020-08-18&to=2020-08-18&sortBy=relevancy&apiKey=0681983eba5a4325af53378169f48daa"
        
        API.fetch(type: NewsResult.self, urlString: urlOne, decodingStrategy: .useDefaultKeys) { result in
            switch result {
            case .success(let data):
                self.newsData = data
            case .failure(_):
                break
            }
        }
    }
}
