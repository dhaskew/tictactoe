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
    case new
    case inProgress
    case finished
}

class Game : CustomStringConvertible
{
    fileprivate var Player1: Player
    fileprivate var Player2: Player
    internal var State: GameState
    fileprivate var Winner: Player?
    fileprivate var CurrentPlayer: Player
    
    
    fileprivate var GameBoard: AsciiBoard
    
    var description: String { return "Game: \(State)"}
    
    init(initial_setup: GameSetup)
    {
        self.Player1 = initial_setup.Player1
        self.Player2 = initial_setup.Player2
        
        //Player1 = Player(player_name: "David", player_type: PlayerType.Human)
        //Player2 = Player(player_name: "Elaine", player_type: PlayerType.Computer)
        
        State = GameState.new
        
        //print(Player1)
        //print(Player2)
        
        GameBoard = AsciiBoard()
        
        GameBoard.Print()
        
        CurrentPlayer = Player1
        
        //print(self)
    }
    
    func Won() -> Bool
    {
        //horizontal wins
        let win1 = CheckWin(p1: 0, p2: 1, p3: 2)
        let win2 = CheckWin(p1: 3, p2: 4, p3: 5)
        let win3 = CheckWin(p1: 6, p2: 7, p3: 8)
        
        //vertical wins
        let win4 = CheckWin(p1: 0, p2: 3, p3: 6)
        let win5 = CheckWin(p1: 1, p2: 4, p3: 7)
        let win6 = CheckWin(p1: 2, p2: 5, p3: 8)
        
        //diagonal wins
        let win7 = CheckWin(p1: 0, p2: 4, p3: 8)
        let win8 = CheckWin(p1: 2, p2: 4, p3: 6)
        
        if( win1 || win2 || win3 || win4 || win5 || win6 || win7 || win8 )
        {
            return true
        }
        
        return false
    }
    
    func CheckWin(p1: Int, p2: Int, p3: Int) -> Bool
    {
        if( (GameBoard.BoardData[p1] == GameBoard.BoardData[p2])
            &&
            (GameBoard.BoardData[p2] == GameBoard.BoardData[p3]) )
        {
            if(GameBoard.BoardData[p1] != " ")
            {
                return true
            }
        }
        return false
    }
    
    func RandomPlay() -> Int
    {
        return 0 + Int(arc4random_uniform(UInt32(8 - 0 + 1)))
    }
    
    func Play()
    {
        State = GameState.inProgress
        
        while(State != GameState.finished)
        {
            //collect user input
            
            let pos: Int
            
            if(CurrentPlayer.TypeOfPlayer == PlayerType.human)
            {
                pos = IO.GetNextPlay(player_name: CurrentPlayer.Name)
            }
            else
            {
                pos = RandomPlay()
            }
        
            //is the input valid?
            
            //update board
            GameBoard.BoardData[pos] = "\(CurrentPlayer.Symbol)"
            
            //print board
            GameBoard.Print()
            
            //calculate if winner
            if( Won() )
            {
                State = GameState.finished
                Winner = CurrentPlayer
                break;
            }
            
            //set next player
            if(CurrentPlayer == Player1)
            {
                CurrentPlayer = Player2
            }
            else
            {
                CurrentPlayer = Player1
            }
        }

        print("The winner is \(CurrentPlayer.Name)")
    }
    
}





