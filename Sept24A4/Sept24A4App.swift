//
//  Sept24A4App.swift
//  Sept24A4
//
//  Created by Vanya Mutafchieva on 23/09/2024.
//

import SwiftUI

@main
struct Sept24A4App: App {
    @State private var game = StandardSetGame()
        var body: some Scene {
            WindowGroup {
                StandardSetGameView(game: game)
            }
        }
}
