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
    
    internal var History: GameHistory?
    
    fileprivate var GameBoard: AsciiBoard
    
    var description: String { return "Game: \(State)"}
    
    fileprivate var Created: Date
    
    init(initial_setup: GameSetup)
    {
        self.Player1 = initial_setup.Player1
        self.Player2 = initial_setup.Player2
        
        State = GameState.new
        
        GameBoard = AsciiBoard()
        
        GameBoard.Print()
        
        CurrentPlayer = Player1
        
        Created = Date();
    }
    
    func HasBeenWon() -> Bool
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
    
    private func SwitchCurrentPlayer() -> Void
    {
        if(CurrentPlayer == Player1)
        {
            CurrentPlayer = Player2
        }
        else
        {
            CurrentPlayer = Player1
        }
    }
    
    func Play()
    {
        State = GameState.inProgress
        
        while(State != GameState.finished)
        {
            //collect user input
            
            var pos: Int?
            
            var validInput = false
            
            while(validInput == false)
            {
                if(CurrentPlayer.TypeOfPlayer == PlayerType.Human)
                {
                    pos = IO.GetNextPlay(player_name: CurrentPlayer.Name)
                }
                else
                {
                    pos = RandomPlay()
                }
                
                //is the input valid?
                validInput = (GameBoard.BoardData[pos!] == " ")
                if(!validInput)
                {
                    if(CurrentPlayer.TypeOfPlayer == PlayerType.Human)
                    {
                        print("Invalid play. Try again.")
                    }
                }
            }

            //update board
            if pos != nil
            {
                GameBoard.BoardData[pos!] = "\(CurrentPlayer.Symbol)"
            }

            if(CurrentPlayer.TypeOfPlayer == PlayerType.Computer)
            {
                print("Computer player played at position \(pos!)")
            }
            
            //print board
            print("")
            GameBoard.Print()
            print("")
            
            //calculate if winner
            if( HasBeenWon() )
            {
                State = GameState.finished
                Winner = CurrentPlayer
                break;
            }
            
            if( GameBoard.Full )
            {
                State = GameState.finished
                break;
            }
            
            //set next player
            SwitchCurrentPlayer()

        }

        if( HasBeenWon() )
        {
            print("The winner is: \(CurrentPlayer.Name). Congrats to the winner!")
        }
        else
        {
            print("The game was a draw!")
        }
    
        self.History = GameHistory(self.GameBoard, self.Player1, self.Player2, self.Created)
    
    }
    
}





