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
        fetchPrice(coin: "bitcoin")
        fetchPrice(coin: "ethereum")
    }
    
    func fetchPrice(coin: String){
        print(Thread.current)
        
        let urlSting = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlSting) else { return }
        
        print("Fetching price..") // 1
        
        // this is asynchronous
        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Did receive data \(data)") // 3
            print(Thread.current)
            guard let data = data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            // print("JSON \(jsonObject)")
            // print(jsonObject)
            guard let value = jsonObject[coin] as? [String: Double] else {
                print("Falied to parse value")
                return
            }
            // print(value)
            guard let price = value["usd"] else { return }
            
            DispatchQueue.main.async {
                print(Thread.current)
                self.coin = coin.capitalized
                self.price = "$\(price)"
            }
        }.resume()
        
        print("Did reach end of function") // 2
        
    }
}
