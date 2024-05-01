//
//  CoinDetails.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/30.
//

import Foundation

struct CoinDetails: Decodable {
    let id: String
    let symbol: String
    let name: String
    let description: Description
}

struct Description: Decodable {
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case text = "en"
    }
}
