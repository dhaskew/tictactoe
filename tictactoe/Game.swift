//
//  Game.swift
//  tictactoe
//
//  Created by David Askew on 9/23/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

enum GameState
{
    case New
    case InProgress
    case Finished
}

class Game : CustomStringConvertible
{
    private var Player1: Player
    private var Player2: Player
    private var State: GameState
    
    private var GameBoard: AsciiBoard
    
    var description: String { return "Game: \(State)"}
    
    init(initial_setup: GameSetup)
    {
        self.Player1 = initial_setup.Player1
        self.Player2 = initial_setup.Player2
        
        //Player1 = Player(player_name: "David", player_type: PlayerType.Human)
        //Player2 = Player(player_name: "Elaine", player_type: PlayerType.Computer)
        
        State = GameState.New
        
        print(Player1)
        print(Player2)
        
        GameBoard = AsciiBoard()
        
        GameBoard.Print()
        
        print(self)
    }
    
}





