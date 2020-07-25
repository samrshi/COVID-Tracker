//
//  UserSettings.swift
//  COVID
//
//  Created by hawkeyeshi on 7/21/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

enum CodingKeys: CodingKey {
    case favoriteState
}

class UserSettings: ObservableObject, Identifiable, Codable {
    var id = UUID() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(id) {
                UserDefaults.standard.set(encoded, forKey: "id")
            }
        }
    }
    
    @Published var favoriteState: String = "" {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(favoriteState) {
                UserDefaults.standard.set(encoded, forKey: "favoriteState")
            }
        }
    }
    //
    //    init(favoriteState: String) {
    //        let defaults = UserDefaults.standard
    //
    //        if let myState = defaults.string(forKey: "favoriteState") {
    //            self.favoriteState = myState
    //            return
    //        }
    //
    //        self.favoriteState = favoriteState
    //    }
    
    init() {
        let defaults = UserDefaults.standard
        
        if let myState = defaults.string(forKey: "favoriteState") {
            print("decoded")

            self.favoriteState = myState
            return
        }
        
        self.favoriteState = "NC"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        favoriteState = try container.decode(String.self, forKey: .favoriteState)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(favoriteState, forKey: .favoriteState)
    }
}
