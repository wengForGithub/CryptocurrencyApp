//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/28.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    @Published var coinDetails: CoinDetails?
    
    private let service: CoinServiceProtocol
    
    init(service: CoinServiceProtocol) {
        self.service = service
        Task { 
            await fetchCoins()
        }
    }
    
    @MainActor
    func fetchCoins() async {
        do {
            let coins = try await service.fetchCoins()
            self.coins.append(contentsOf: coins)
        } catch {
            guard let error = error as? CoinAPIError else { return }
            self.errorMessage = error.customDescription
        }

    }

// this is for @EnvironmentObject
//    @MainActor
//    func fetchCoinDetails(coinId: String) async {
//        do {
//            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
////            print("DEBUG: Details \(details)")
//        } catch {
//            print("DEBUG: Error \(error.localizedDescription)")
//        }
//    }
    
    
// this is for Completion Handler
//    func fetchCoinsWithCompletionHandler(){
//        service.fetchCoinsWithResult { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let coins):
//                    self?.coins = coins
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }

}
