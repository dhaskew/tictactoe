//
//  main.swift
//  tictactoe
//
//  Created by David Askew on 9/16/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

let events = EventManager()

func BeforeNewGameListener(information:Any?)
{
    if let info = information as? String {
        print(info)
    }
}

events.listenTo(eventName: "BeforeNewGame", action: BeforeNewGameListener)

events.listenTo(eventName: "BeforeQuit", action: {
    print("Cleaning up and exiting ...");
});


func GameOverHandler(information:Any?)
{
    if let game = information as? Game {
        game.History?.Print()
    }
}

events.listenTo(eventName: "GameOver", action: GameOverHandler)

var fc = FrameworkClass()

IO.PrintWelcomeMessage()

while(true)
{
    let response: String = IO.StartMainMenu()
    
    if(response.lowercased() == "n")
    {
        events.trigger(eventName: "BeforeNewGame", information: "A new game is about to start")
        
        let setup: GameSetup = IO.SetupGame()
        
        var NewGame = Game(initial_setup: setup)
        
        NewGame.Play()
        
        events.trigger(eventName: "GameOver", information: NewGame)
    }
    else if(response.lowercased() == "a")
    {
        print("This application was written by David Askew")
    }
    else if(response.lowercased() == "q")
    {
        events.trigger(eventName: "BeforeQuit")
        sleep(3)
        exit(EXIT_SUCCESS)
    }
    else
    {
        print("Invalid selection.  Please try again.")
    }
}



//print("Press Return [Enter] to Continue.")

//var _ = IO.GetInputAsString()
