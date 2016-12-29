//
//  main.swift
//  tictactoe
//
//  Created by David Askew on 9/16/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

var fc = FrameworkClass()

IO.PrintWelcomeMessage()

var ContinueMainMenuLoop = true

while(ContinueMainMenuLoop)
{
    let response = IO.StartMainMenu()
    
    if(response.lowercased() == "n")
    {
        let setup = IO.SetupGame()
        
        var NewGame = Game(initial_setup: setup)
        
        //print(setup.Player1)
        //print(setup.Player2)
        
        NewGame.Play()
        
        NewGame.History?.Print()
        
        //sleep(5)
    }
    else if(response.lowercased() == "a")
    {
        print("This application was written by David Askew")
    }
    else if(response.lowercased() == "q")
    {
        exit(EXIT_SUCCESS)
    }
    else
    {
        print("Invalid selection.  Please try again.")
    }
}



//print("Press Return [Enter] to Continue.")

//var _ = IO.GetInputAsString()
