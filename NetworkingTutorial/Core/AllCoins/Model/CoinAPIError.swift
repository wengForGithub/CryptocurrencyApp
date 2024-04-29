//
//  CoinAPIError.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/29.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(desription: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case let .requestFailed(desription): return "Request failed: \(desription)"
        case let .invalidStatusCode(statusCode):return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "An nuknown error occured \(error.localizedDescription)"
        }
    }
}
