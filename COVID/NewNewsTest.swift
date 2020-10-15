//
//  NewNewsTest.swift
//  COVID
//
//  Created by hawkeyeshi on 8/21/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

struct NewNewsResponse: Codable {
    let articles: [NewArticle]
}

struct NewArticle: Codable {
    let id = UUID()
    
    let title: String
    let link: String
    let published: String
    let source: Source
    
    struct Source: Codable {
        let href: String
        let title: String
    }
}

class NewNewsData: ObservableObject {
    @Published var result: NewNewsResponse = NewNewsResponse(articles: [])
    init() {
        let headers = [
            "x-rapidapi-host": "google-news.p.rapidapi.com",
            "x-rapidapi-key": "6e99dbba7cmshd271de913b29637p1f9b01jsna2166a4fbd2d"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://google-news.p.rapidapi.com/v1/search?country=UK&lang=en&q=covid-19")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("bad")
                return
            }
            
            DispatchQueue.main.async {
               do {
                self.result = try JSONDecoder().decode(NewNewsResponse.self, from: data)
                } catch let err {
                    print(err)
                }
            }
        }.resume()
    }
}
