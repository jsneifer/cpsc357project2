//
//  ContentView.swift
//  Shared
//
//  Created by Joseph Sneifer on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameStore : GameStore = GameStore(games: GameData)
    
    @State private var pageNumber = 1
    
    var body: some View {
        Color.white
            .ignoresSafeArea() // Ignore just for the color
            .overlay(
                NavigationView{
                    VStack(alignment: .center) {
                        Text("Video Games")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding()
                        
                        Divider()
                        if pageNumber == 1 {
                            PageOne(gameStore: $gameStore)
                        } else if pageNumber == 2 {
                            PageTwo(gameStore: $gameStore)
                        } else if pageNumber == 3 {
                            PageThree(gameStore: $gameStore)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: AddGame(gameStore: gameStore)) {
                            HStack {
                                Image(systemName: "plus")
                                    .foregroundColor(.blue)
                                Text("Add New Game")
                                    .foregroundColor(.blue)
                                    .font(.title3)
                            }
                        }
                        
                        Divider()
                        
                        HStack(alignment: .center) {
                            VStack {
                                ZStack {
                                    Image(systemName: "arrow.left")
                                    Button("      ") {
                                        if pageNumber > 1 {
                                            pageNumber -= 1
                                        }
                                    }
                                }
                                
                                Text("Previous")
                                    .padding()
                            }
                            Spacer()
                            
                            Text("\(pageNumber)")
                            
                            Spacer()
                            
                            VStack {
                                ZStack {
                                    Image(systemName: "arrow.right")
                                    Button("      ") {
                                        if pageNumber < 3 {
                                            pageNumber += 1
                                        }
                                    }
                                }
                                Text("Next")
                                    .padding()
                            }
                        }
                        
                    }
                    .navigationBarHidden(true)
                })
    }
}

struct PageOne: View {
    
    @Binding var gameStore: GameStore
    
    @State var rpgs: [Game] = []
    
    var body: some View {
        
        Text("RPG Titles")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.red)
            .padding()
        
        NavigationView {
            List {
                ForEach (gameStore.games) { game in
                    if(game.genre == "rpg") {
                        ListCell(game: game)
                    }
                }
            }
        }
    }
}

struct PageTwo: View {
    
    @Binding var gameStore: GameStore
    
    @State var fps: [Game] = []
    
    var body: some View {
        
        Text("FPS Titles")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.red)
            .padding()
        
        NavigationView {
            List {
                ForEach (gameStore.games) { game in
                    if(game.genre == "fps") {
                        ListCell(game: game)
                    }
                }
            }
        }
    }
}

struct PageThree: View {
    
    @Binding var gameStore: GameStore
    
    @State var mmo: [Game] = []
    
    var body: some View {
        
        Text("MMO Titles")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.red)
            .padding()
        
        NavigationView {
            List {
                ForEach (gameStore.games) { game in
                    if(game.genre == "mmo") {
                        ListCell(game: game)
                    }
                }
            }
        }
    }
}

struct ListCell: View {
    var game: Game
    var body: some View {
        NavigationLink(destination: GameDetail(selectedGame: game)) {
            Text(game.id)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
        }
    }
}



struct Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
