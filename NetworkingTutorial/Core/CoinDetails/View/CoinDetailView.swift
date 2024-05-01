//
//  CoinDetailView.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/30.
//

import SwiftUI

struct CoinDetailView: View {
    let coin: Coin
    
    @ObservedObject var viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id)
    }
    
    var body: some View {
        Text(coin.name)
    }
}

//#Preview {
//    CoinDetailView()
//}
