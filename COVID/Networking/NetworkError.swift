//
//  NetworkError.swift
//  COVID
//
//  Created by hawkeyeshi on 8/16/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
    case unknown
    case invalidHTTPCode
}
