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
        if let details = viewModel.coinDetails {
            VStack(alignment: .leading) {
                Text(details.name)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                
                Text(details.symbol.uppercased())
                    .font(.footnote)
                
                Text(details.description.text)
                    .font(.footnote)
            }
            .padding()
        }
    }
}

//#Preview {
//    CoinDetailView()
//}
