//
//  PokerHandlerTests.swift
//  PokerHandlerTests
//
//  Created by Colin Masters on 2018-04-27.
//  Copyright © 2018 iqmetrix. All rights reserved.
//

import XCTest
@testable import PokerHandler

class PokerHandlerTests: XCTestCase {
    
    func testSingleKingBeatsSingleQueen() {
        let kingHand = Hand(player: "king", cards: [Card(suit: .spades, rank: .king)])
        let queenHand = Hand(player: "queen", cards: [Card(suit: .spades, rank: .queen)])
        
        XCTAssert(kingHand > queenHand)
    }
    
    func testHighCardHands() {
        let joesHand = Hand(player: "Joe", cards: [
            Card(suit: .hearts, rank: .three),
            Card(suit: .diamonds, rank: .six),
            Card(suit: .clubs, rank: .eight),
            Card(suit: .clubs, rank: .jack),
            Card(suit: .spades, rank: .king)
            ])
        
        let jensHand = Hand(player: "Jen", cards: [
            Card(suit: .clubs, rank: .three),
            Card(suit: .hearts, rank: .six),
            Card(suit: .spades, rank: .eight),
            Card(suit: .spades, rank: .jack),
            Card(suit: .diamonds, rank: .queen)
            ])
        
        let winners = PokerHandler.winnersFrom(hands: [joesHand, jensHand])
        
        XCTAssert(winners[0].player == "Joe")
    }
    
    func testExampleOne() {
        let joesHand = Hand(player: "Joe", cards: [
            Card(suit: .hearts, rank: .three),
            Card(suit: .hearts, rank: .six),
            Card(suit: .hearts, rank: .eight),
            Card(suit: .hearts, rank: .jack),
            Card(suit: .hearts, rank: .king)
        ])
        
        let jensHand = Hand(player: "Jen", cards: [
            Card(suit: .clubs, rank: .three),
            Card(suit: .diamonds, rank: .three),
            Card(suit: .spades, rank: .three),
            Card(suit: .clubs, rank: .eight),
            Card(suit: .diamonds, rank: .ten)
            ])
        
        let bobsHand = Hand(player: "Bob", cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .clubs, rank: .five),
            Card(suit: .spades, rank: .seven),
            Card(suit: .clubs, rank: .ten),
            Card(suit: .clubs, rank: .ace)
            ])
        
        let winners = PokerHandler.winnersFrom(hands: [joesHand, jensHand, bobsHand])
        
        XCTAssert(winners[0].player == "Joe")
    }
    
    func testExampleTwo() {
        let joesHand = Hand(player: "Joe", cards: [
            Card(suit: .hearts, rank: .three),
            Card(suit: .diamonds, rank: .four),
            Card(suit: .clubs, rank: .nine),
            Card(suit: .diamonds, rank: .nine),
            Card(suit: .hearts, rank: .queen)
            ])
        
        let jensHand = Hand(player: "Jen", cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .diamonds, rank: .seven),
            Card(suit: .hearts, rank: .nine),
            Card(suit: .spades, rank: .nine),
            Card(suit: .spades, rank: .queen)
            ])
        
        let bobsHand = Hand(player: "Bob", cards: [
            Card(suit: .hearts, rank: .two),
            Card(suit: .clubs, rank: .two),
            Card(suit: .spades, rank: .three),
            Card(suit: .clubs, rank: .eight),
            Card(suit: .diamonds, rank: .ten)
            ])
        
        let winners = PokerHandler.winnersFrom(hands: [joesHand, jensHand, bobsHand])
        
        XCTAssert(winners[0].player == "Jen")

    }
    
    func testIdenticalHands() {
        let joesHand = Hand(player: "Joe", cards: [
            Card(suit: .clubs, rank: .five),
            Card(suit: .diamonds, rank: .seven),
            Card(suit: .hearts, rank: .nine),
            Card(suit: .spades, rank: .nine),
            Card(suit: .spades, rank: .queen)
            ])
        
        let jensHand = Hand(player: "Jen", cards: [
            Card(suit: .spades, rank: .five),
            Card(suit: .hearts, rank: .seven),
            Card(suit: .clubs, rank: .nine),
            Card(suit: .diamonds, rank: .nine),
            Card(suit: .diamonds, rank: .queen)
            ])
        
        let winners = PokerHandler.winnersFrom(hands: [joesHand, jensHand])
        
        XCTAssert(winners.count == 2)
    }
    
}
