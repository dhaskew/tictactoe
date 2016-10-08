//
//  main.swift
//  tictactoe
//
//  Created by David Askew on 9/16/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import Foundation

IO.PrintWelcomeMessage()

let setup = IO.SetupGame()

var g = Game(initial_setup: setup)

exit(EXIT_SUCCESS)