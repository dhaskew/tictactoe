//
//  Board.swift
//  tictactoe
//
//  Created by David Askew on 9/24/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

class Board : Equatable
{
    private var BoardData: [String] = [" "," "," "," "," "," "," "," "," "]
    
    init()
    {
        Logger.Log(self,#function,"Board object created");
    }
    
}

class AsciiBoard : Board
{
    override init()
    {
        super.init()
        Logger.Log(self,#function,"Ascii Board object created");
    }
    
    func Print()
    {
        //print(super.BoardData)
        
        print(super.BoardData[0] + " | " + super.BoardData[1] + " | " + super.BoardData[2])
        print("---------")
        print(super.BoardData[3] + " | " + super.BoardData[4] + " | " + super.BoardData[5])
        print("---------")
        print(super.BoardData[6] + " | " + super.BoardData[7] + " | " + super.BoardData[8])
        sleep(5)
    }
}

func ==(lhs: Board, rhs: Board) -> Bool {
    return lhs.BoardData == rhs.BoardData
}