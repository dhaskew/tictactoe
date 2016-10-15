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
    
    
    func testPlayer()
    {
        let p1 = Player(player_name: "p1name", player_type: PlayerType.human, player_symbol: "O")
        let p2 = Player(player_name: "p2name", player_type: PlayerType.human, player_symbol: "X")
        XCTAssertNotEqual(p1.Name, p2.Name, "\(p1.Name) is not \(p2.Name)")
    }
 
    
    /*
    func testfailOnPurposeTest()
    {
        let p1 = Player(player_name: "p1name", player_type: PlayerType.Human)
        let p2 = Player(player_name: "p2name", player_type: PlayerType.Human)
        let gs = GameSetup(PlayerCount: 2, Player1: p1, Player2: p2)
        
        XCTAssert(p1 !== p2, "p1 and p2 is the same object")
        XCTAssertNotEqual(p1, p2, "p1 is equal to p2")
        XCTAssertNotNil(gs, "GameSetup is nil")
    }
    */
    
    func testNewPlayerPerformance()
    {
        self.measure({
            let p1 = Player(player_name: "p1name", player_type: PlayerType.human, player_symbol: "O")
            let p2 = Player(player_name: "p2name", player_type: PlayerType.human, player_symbol: "X")
            XCTAssertNotEqual(p1.Name, p2.Name, "\(p1.Name) is not \(p2.Name)")
        })

    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    */
}
