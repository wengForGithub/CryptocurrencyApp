//
//  CoinsViewModel.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/28.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coin = ""
    @Published var price = ""
    
    init() {
        fetchPrice()
    }
    
    func fetchPrice(){
        let urlSting = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"
        guard let url = URL(string: urlSting) else { return }
        
        print("Fetching price..")
        
//        this is asynchronous
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Did receive data \(data)")
        }.resume()
        
        print("Did reach end of function")
        
    }
}
