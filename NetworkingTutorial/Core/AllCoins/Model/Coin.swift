//
//  Coin.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/29.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
//    let currentPrice: Double
//    let marketCapRank: Int
}
