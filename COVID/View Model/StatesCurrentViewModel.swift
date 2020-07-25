////
////  StatesCurrentViewModel.swift
////  COVID
////
////  Created by hawkeyeshi on 7/17/20.
////  Copyright © 2020 samrshi. All rights reserved.
////
//
//import Foundation
//
//class StatesCurrentViewModel: ObservableObject {
//    @Published var data: [StateModel] = []
//    @Published var favoriteState: StateModel = emptyState
//    
//    static let url = "https://covidtracking.com/api/v1/states/current.json"
//    // https://covidtracking.com/api/v1/states/current.json
//    
//    init() {
//        data = []
//        
//        guard let url = URL(string: StatesCurrentViewModel.url) else {
//            print("Invalid URL")
//            return
//        }
//                
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//                        
//            guard let response = response as? HTTPURLResponse else { return }
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        self.data = try JSONDecoder().decode([StateModel].self, from: data)
//                        self.favoriteState = self.data.first(where: { $0.state == "NC" })!
//                    } catch let err {
//                        print("Error: \(err)")
//                    }
//                }
//            } else {
//                print("HTTPURLResponse code: \(response.statusCode)")
//            }
//        }.resume()
//    }
//}
//
//
