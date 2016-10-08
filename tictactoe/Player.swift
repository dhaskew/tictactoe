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
    case Human
    case Computer
}

class Player : CustomStringConvertible, Equatable
{
    internal var Name: String
    private var Type: PlayerType
    
    var description: String
    {
        return "Player: \(Name) - Type: \(Type)"
    }
    
    init(player_name: String, player_type: PlayerType)
    {
        Name = player_name
        Type = player_type
    }
    
}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.Name == rhs.Name
}