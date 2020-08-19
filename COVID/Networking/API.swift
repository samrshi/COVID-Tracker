//
//  API.swift
//  COVID
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

public class API {
    static func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                    
                } catch let err {
                    print(err)
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}
