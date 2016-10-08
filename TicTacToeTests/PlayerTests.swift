//
//  PlayerTests.swift
//  tictactoe
//
//  Created by David Askew on 10/7/16.
//  Copyright © 2016 David Askew. All rights reserved.
//

import XCTest
@testable import tictactoe

class PlayerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testBoard()
    {
        let a = AsciiBoard()
        let b = AsciiBoard()
        XCTAssertEqual(a, b)
        XCTAssert(a !== b)
    }
    
    func testPlayer()
    {
        let p1 = Player(player_name: "p1name", player_type: PlayerType.Human)
        let p2 = Player(player_name: "p2name", player_type: PlayerType.Human)
        XCTAssertNotEqual(p1.Name, p2.Name, "\(p1.Name) is not \(p2.Name)")
    }
    
    func testfailOnPurposeTest()
    {
        let p1 = Player(player_name: "p1name", player_type: PlayerType.Human)
        let p2 = Player(player_name: "p2name", player_type: PlayerType.Human)
        let gs = GameSetup(PlayerCount: 2, Player1: p1, Player2: p2)
        
        XCTAssert(p1 !== p2)
        XCTAssertNotEqual(p1, p2)
        XCTAssertNotNil(gs)
        
        //let p1 = Player(player_name: "player1", player_type: PlayerType.Human)
        //p1.Name = "new name"
        //XCTAssert(p1.Name == "player1")
        //XCTAssertEqual(p1.Name , "player1", "message")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
