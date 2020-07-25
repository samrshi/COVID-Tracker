//
//  Settings.swift
//  COVID
//
//  Created by hawkeyeshi on 7/21/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var favoriteState: String {
        didSet {
            if let encoded = try? JSONEncoder().encode(favoriteState) {
                UserDefaults.standard.set(encoded, forKey: "favoriteState")
            }
        }
    }
    
    init() {
        if let favoriteState = UserDefaults.standard.data(forKey: "favoriteState") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(String.self, from: favoriteState) {
                self.favoriteState = decoded
                return
            }
        }
        self.favoriteState = "NC"
    }
}
