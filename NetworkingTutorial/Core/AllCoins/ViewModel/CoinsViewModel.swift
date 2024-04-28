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
    @Published var errorMessage: String?
    
    init() {
        fetchPrice(coin: "bitcoin")
//        fetchPrice(coin: "ethereum")
    }
    
    func fetchPrice(coin: String){
        let urlSting = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlSting) else { return }
            
        // this is asynchronous
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("DEBUG: Failed with error \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.errorMessage = "Bad HTTP Response"
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
                    return 
                }
                
                guard let data = data else { return }
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                guard let value = jsonObject[coin] as? [String: Double] else {
                    print("Falied to parse value")
                    return
                }
                guard let price = value["usd"] else { return }
                
                self.coin = coin.capitalized
                self.price = "$\(price)"
            }
        }.resume()
        
        print("Did reach end of function") // 2
        
    }
}
