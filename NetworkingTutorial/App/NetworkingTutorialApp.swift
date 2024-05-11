//
//  NetworkingTutorialApp.swift
//  NetworkingTutorial
//
//  Created by Owen on 2024/4/28.
//

import SwiftUI

@main
struct NetworkingTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: CoinDataService())
//            ContentView(service: MockCoinService())
        }
    }
}
