//
//  Player.swift
//  tictactoe
//
//  Created by David Askew on 9/23/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

enum PlayerType
{
    case human
    case computer
}

class Player : CustomStringConvertible, Equatable
{
    internal var Name: String
    internal var TypeOfPlayer: PlayerType
    internal var Symbol: Character
    
    var description: String
    {
        return "Player: \(Name) - Type: \(TypeOfPlayer)"
    }
    
    init(player_name: String, player_type: PlayerType, player_symbol: Character)
    {
        Name = player_name
        TypeOfPlayer = player_type
        Symbol = player_symbol
    }
    
}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.Name == rhs.Name
}
