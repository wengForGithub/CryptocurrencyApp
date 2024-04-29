//
//  ContentView.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                Text(coin.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
