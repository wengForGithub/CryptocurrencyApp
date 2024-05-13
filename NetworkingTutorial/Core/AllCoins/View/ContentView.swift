//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/28.
//

import SwiftUI

struct ContentView: View {
    private let service: CoinServiceProtocol
    @StateObject var viewModel: CoinsViewModel
    
    init(service: CoinServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: CoinsViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(value: coin) {
                        HStack(spacing: 12) {
                            Text("\(coin.marketCapRank)")
                                .foregroundStyle(.gray)
                            
//                            AsyncImage(url: URL(string: coin.image)) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 32, height: 32)
//                            } placeholder: {
//                                EmptyView()
//                            }
                            CoinImageView(url: coin.image)
                                .frame(width: 32, height: 32)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(coin.name)
                                    .fontWeight(.semibold)
                                
                                 Text(coin.symbol.uppercased())
                            }
                        }
                        .onAppear {
                            if coin == viewModel.coins.last {
//                              print("DEBUG: Paginate here...")
                                Task {await viewModel.fetchCoins()}
                            }
                        }
                        .font(.footnote)
                    }
                }
            }
            
            .navigationDestination(for: Coin.self, destination: { coin in
                CoinDetailView(coin: coin, service: service)
            })
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
        }
        
        .task {
            await viewModel.fetchCoins()
        }
    }
}

#Preview {
    ContentView(service: CoinDataService())
//    ContentView(service: MockCoinService())
}
