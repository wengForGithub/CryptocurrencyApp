//
//  CoinDetailsCache.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/5/2.
//

import Foundation

class CoinDetailsCache {
    
    static let shared = CoinDetailsCache() // static guarantee this is initialized only once
    
    private let cache = NSCache<NSString, NSData>()
//    private let cache = NSCache<NSString, CoinDetails>() // this will need the CoinDetails to be a class
    
    private init() { }
    
    // setter
    func set(_ coinDetails: CoinDetails, forKey key: String) {
        guard let data = try? JSONEncoder().encode(coinDetails) else { return }
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    // getter
    func get(forKey key: String) -> CoinDetails? {
        guard let data = cache.object(forKey: key as NSString) as? Data else { return nil }
        return try? JSONDecoder().decode(CoinDetails.self, from: data)
    }
}
