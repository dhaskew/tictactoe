//
//  IO.swift
//  tictactoe
//
//  Created by David Askew on 10/3/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

class IO
{
    
    static func PrintWelcomeMessage()
    {
        print("")
        print("-------------------------")
        print("  Welcome to TicTacToe!")
        print("-------------------------")
        print("")
    }
    
    static func GetInput() -> String
    {
        
        // 1
        let keyboard = FileHandle.standardInput
        
        // 2
        let inputData = keyboard.availableData
        
        // 3
        let strData = NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)!
        
        // 4
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    static func GetNextPlay(player_name: String) -> Int
    {
        print("Your turn \(player_name). What position to play [0-8]?")
        print("--->  ", terminator: "")
        let position = Int(IO.GetInput())
        return position!
    }
    
    static func SetupGame() -> GameSetup
    {
        print("What is your name?")
        print("--->  ", terminator: "")
        let name = IO.GetInput()
        print("")
        print("Hello \(name)")
        print("")
        print("How many players?")
        print("--->  ", terminator: "")
        let players = Int(IO.GetInput())
        print("")
        print("Players: \(players!)")
        print("")
    
        let p1 = Player(player_name: name, player_type: PlayerType.human, player_symbol: "X")
        
        var p2: Player
        
        if(players! == 1)
        {
            p2 = Player(player_name: "CPU", player_type: PlayerType.computer, player_symbol: "O")
        }
        else
        {
            print("What is name of player 2?")
            print("--> ", terminator: "")
            let name2 = IO.GetInput()
            print("")
            p2 = Player(player_name: name2, player_type: PlayerType.human, player_symbol: "O")
        }
        
        let GS = GameSetup(PlayerCount: players!, Player1: p1, Player2: p2)
    
        return GS
    }
    
    //let stderr = NSFileHandle.fileHandleWithStandardError()
    //let stdout = NSFileHandle.fileHandleWithStandardOutput()
}

