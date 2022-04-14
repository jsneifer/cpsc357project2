//
//  GameDetail.swift
//  Project2
//
//  Created by Joseph Sneifer on 4/13/22.
//

import SwiftUI

struct GameDetail: View {
    
    let selectedGame: Game
    
    var body: some View {
        Form {
            Section(header: Text("Game Details")) {
                Text(selectedGame.id)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                HStack {
                    Text("Rating (IGN) : ")
                        .foregroundColor(.red)
                        .font(.headline)
                    
                    Text("\(selectedGame.rating, specifier: "%.1f")/10")
                }
                .padding()
                .multilineTextAlignment(.center)

                Text(selectedGame.description)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding()
            }
        }
    }
}

struct GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(selectedGame: GameData[0])
    }
}
