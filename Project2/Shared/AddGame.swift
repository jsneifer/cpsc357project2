//
//  AddGame.swift
//  Project2
//
//  Created by Joseph Sneifer on 4/8/22.
//

import SwiftUI

struct AddGame: View {
    @StateObject var gameStore: GameStore
    @State private var id: String = ""
    @State private var rating: Double = 0.0
    @State private var speed = 5.0
    enum genre: String {
        case rpg, fps, mmo
    }
    @State private var selectedGenre: genre = .rpg
    @State private var description: String = ""
    
    func AddGame() {
        let newGame = Game(id: id, rating: speed, genre: selectedGenre.rawValue, description: description)
        gameStore.games.append(newGame)
    }
    
    
    
    var body: some View {
        
        Form {
            Section(header: Text("Game Details")) {
                DataInput(title: "Title", userInput: $id)
                VStack {
                    Slider(
                        value: $speed,
                        in: 0...10.0,
                        step: 0.1
                    )
                    Text("\(speed, specifier: "%.1f")")
                        .foregroundColor(.red)
                }
            
                List {
                    Picker("genre", selection: $selectedGenre) {
                        Text("RPG").tag(genre.rpg)
                        Text("FPS").tag(genre.fps)
                        Text("MMO").tag(genre.mmo)
                    }.pickerStyle(.menu)
                }
                
                DataInput(title: "Description", userInput: $description)
            }
            Button(action: AddGame) {
                Text("Add Game")
            }
        }
    }
}

struct AddGame_Previews: PreviewProvider {
    static var previews: some View {
        AddGame(gameStore: GameStore(games: GameData))
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
