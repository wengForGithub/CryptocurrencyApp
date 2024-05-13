//
//  CoinImageView.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/5/13.
//

import SwiftUI

struct CoinImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(url: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")
    }
}
