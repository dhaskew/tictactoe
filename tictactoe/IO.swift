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
    
    
    //TODO: We should be trapping CNTRL-C.
    //Quiters should be allowed to quit without losing.
    
    //FIXME: Test FIXME
    
    //MARK: - Test Mark
    
    static func PrintWelcomeMessage()
    {
        print("")
        print("-------------------------")
        print("  Welcome to TicTacToe!")
        print("-------------------------")
        print("")
    }
    
    
    static func StartMainMenu() -> String
    {
        print("")
        
        print("[N]: New Game")
        print("[A]: About")
        print("[Q]: Quit")
        
        print("")
        
        let response = GetInputAsStringWithPrompt(UserPrompt: "What would you like to do?")
        
        return response
    }
    
    static func GetInputAsStringWithPrompt(UserPrompt: String) -> String
    {
        print(UserPrompt)
        print("--->  ", terminator: "")
        let response = GetInputAsString()
        return response
    }
    
    //MARK: - Test Mark 2
    
    static func GetInputAsString() -> String
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
        var inputValid = false
        var position: Int?
        var pos_string: String?
        
        while(!inputValid)
        {
            print("Your turn \(player_name). What position to play [0-8]? or [h] for help or [q] for quit.")
            print("--->  ", terminator: "")
            pos_string = IO.GetInputAsString()
            
            if(pos_string == "")
            {
                inputValid = false
                continue
            }
            
            if (pos_string!.isNumeric)
            {
                position = Int(pos_string!)
                inputValid = true
            }
            
            if(pos_string == "h")
            {
                PrintHelp()
            }
            
            if(pos_string == "q")
            {
                print("Goodbye quiter!")
                sleep(2)
                exit(EXIT_SUCCESS)
            }
            
        }

        return position!
    }
    
    static func PrintHelp()
    {
        print("Help Text Goes Here")
        AsciiBoard.PrintHelp()
    }
    
    static func GetNumPlayers() -> Int
    {
        var inputValid = false
        var players: Int?
        var pcount_string = ""
        
        while(!inputValid || pcount_string.isEmpty)
        {

            print("How many players?")
            print("--->  ", terminator: "")
                
            pcount_string = IO.GetInputAsString()
                
            if (pcount_string.isNumeric)
            {
                players = Int(pcount_string)
                    
                inputValid = true
            }
            else
            {
                pcount_string = ""
            }

        }
        
        return players!
    }
    
    static func SetupGame() -> GameSetup
    {
        var name = ""
        
        while(name.isEmpty)
        {
            print("What is your name?")
            print("--->  ", terminator: "")
            name = IO.GetInputAsString()
        }
        
        print("")
        print("Hello \(name)")
        print("")
        
        var players: Int?
        var player_count_valid = false
        
        while(player_count_valid != true)
        {
            players = GetNumPlayers()
            
            if(players! <= 2 && players! > 0)
            {
                player_count_valid = true;
            }
        }

        let p1 = Player(player_name: name, player_type: PlayerType.Human, player_symbol: "X")
        
        var p2: Player
        
        if(players == 1)
        {
            p2 = Player(player_name: "CPU", player_type: PlayerType.Computer, player_symbol: "O")
        }
        else
        {
            var name2 = ""
            
            while(name2.isEmpty)
            {
                print("What is name of player 2?")
                print("--> ", terminator: "")
                name2 = IO.GetInputAsString()
                print("")
            }
            
            p2 = Player(player_name: name2, player_type: PlayerType.Human, player_symbol: "O")
        }
        
        let GS = GameSetup(PlayerCount: players!, Player1: p1, Player2: p2)
    
        return GS
    }
    
    
    
    //let stderr = NSFileHandle.fileHandleWithStandardError()
    //let stdout = NSFileHandle.fileHandleWithStandardOutput()
}

//MARK: Extension Methods

extension String
{
    var isNumeric: Bool
    {
        let range = self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
        return (range == nil)
    }
}

