//
//  MockCoinService.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/5/2.
//

import Foundation

class MockCoinService: CoinServiceProtocol {
    func fetchCoins() async throws -> [Coin] {
        let bitcoin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", currentPrice: 26000, marketCapRank: 1)
        return [bitcoin]
    }
    
    func fetchCoinDetails(id: String) async throws -> CoinDetails? {
        let description = Description(text: "Text description")
        let bitcoinDetails = CoinDetails(id: "bitcoin", symbol: "btc", name: "Bitcoin", description: description)
        return bitcoinDetails
    }
    
    
}
