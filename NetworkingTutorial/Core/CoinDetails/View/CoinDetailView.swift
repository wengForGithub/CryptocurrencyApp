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
//    @State private var task: Task<(), Never>? // let me cancel the task when I want to
    
    init(coin: Coin, service: CoinServiceProtocol) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id, service: service)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                Text(details.name)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                
                Text(details.symbol.uppercased())
                    .font(.footnote)
                
                Text(details.description.text)
                    .font(.footnote)
                    .padding(.vertical)
            }
        }
        .task {
            await viewModel.fetchCoinDetails()
            // task modifier handle the switch back scenario
        }
//        .onAppear {
////            print("DEBIG: Detail view did appear")
//            self.task = Task { await viewModel.fetchCoinDetails() }
//        }
//        .onDisappear {
//            task?.cancel() // I save the API call when user quickly switch back to main page
//        }
        .padding()
        
    }
}

//#Preview {
//    CoinDetailView()
//}
