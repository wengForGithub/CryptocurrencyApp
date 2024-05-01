//
//  CoinDetailsViewModel.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/30.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    
    private let service = CoinDataService()
    private let coinId: String
    
    @Published var coinDetails: CoinDetails?
    
    init(coinId: String) {
        print("DEBUG: Did init...")
        self.coinId = coinId
        
//        Task { await fetchCoinDetails() }
    }
    
    @MainActor
    func fetchCoinDetails() async {
//        print("DEBUG: Fetching coins")
//        try? await Task.sleep(nanoseconds: 2_000_000_000)
//        print("DEBUG: Task woke up")
        
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
//            print("DEBUG: Details \(details)")
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
        }
    }
}
