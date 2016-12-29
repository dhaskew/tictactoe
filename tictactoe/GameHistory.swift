//
//  GameHistory.swift
//  tictactoe
//
//  Created by David Askew on 10/8/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

class GameHistory
{
    let Board: Board
    let Player1: Player
    let Player2: Player
    let GameCreated: Date
    
    init (_ GameBoard: Board, _ P1: Player, _ P2: Player , _ Created: Date)
    {
        Board = GameBoard
        Player1 = P1
        Player2 = P2
        GameCreated = Created
    }
    
    func Print() -> Void
    {
        
        // Count the number of times each position was played.  The highest count was played first
        var FlatData: [String] = [" "," "," "," "," "," "," "," "," "]
        
        for boarddata in 0..<Board.History.count
        {
            var nextBoardData = Board.History[boarddata]
            
            //print(nextBoardData)
            
            for play in 0..<nextBoardData.count
            {
                if(nextBoardData[play] != " ") && (FlatData[play] == " ")
                {
                    FlatData[play] = "\(boarddata+1)";
                }
            }
            
        }
        
        print("History (Board): \(FlatData)")
        print("History Player 1 - \(Player1)")
        print("History Player 2 - \(Player2)")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        print("History (Game Created): \(formatter.string(from: GameCreated))")
    }
    
}
