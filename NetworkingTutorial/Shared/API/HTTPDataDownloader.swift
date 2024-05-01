//
//  HTTPDataDownloader.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/5/1.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension HTTPDataDownloader {
    // this is a reusable function and a Generic function
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {
        
        guard let url = URL(string: endpoint) else {
            throw CoinAPIError.requestFailed(desription: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinAPIError.requestFailed(desription: "Request failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        // this is Generics, to decode any type of the data
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("DEBUG: Error \(error)")
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
}
