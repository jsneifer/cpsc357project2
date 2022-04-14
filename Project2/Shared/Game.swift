//
//  Game.swift
//  Project2
//
//  Created by Joseph Sneifer on 4/12/22.
//

import SwiftUI

struct Game : Codable, Identifiable {
    
    var id: String
    var rating: Double
    
    var genre: String
    
    var description: String
}
