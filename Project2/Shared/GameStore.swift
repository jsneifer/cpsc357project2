//
//  GameStore.swift
//  Project2
//
//  Created by Joseph Sneifer on 4/12/22.
//

import SwiftUI
import Combine

class GameStore: ObservableObject {
    @Published var games: [Game]
    
    init (games: [Game] = []) {
        self.games = games
    }
}
