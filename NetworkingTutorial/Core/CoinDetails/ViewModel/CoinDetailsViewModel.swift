//
//  CoinDetailsViewModel.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/30.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    
    private let service: CoinServiceProtocol
    private let coinId: String
    
    @Published var coinDetails: CoinDetails?
    
    init(coinId: String, service: CoinServiceProtocol) {
        self.service = service
        self.coinId = coinId
    }
    
    @MainActor
    func fetchCoinDetails() async {
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
//            print("DEBUG: Details \(details)")
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
