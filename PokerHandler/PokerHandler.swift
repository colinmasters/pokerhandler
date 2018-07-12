//
//  PokerHandler.swift
//  PokerHandler
//
//  Created by Colin Masters on 2018-04-27.
//  Copyright © 2018 iqmetrix. All rights reserved.
//

import Foundation

class PokerHandler: NSObject {
    
    /* Accepts an array of hands and returns the winning hands
     * No checks are carried out for duplicate cards as it is assumed
     * that all hands are fairly dealt from a standard 52 card deck
     */
    class func winnersFrom(hands: [Hand]) -> [Hand] {
        let rankedPlayers = hands.sorted {
            $0.strength.rawValue > $1.strength.rawValue
        }
        
        let potentialWinners = rankedPlayers
            .filter { $0.strength == rankedPlayers[0].strength }
            .sorted { $0 > $1 }
        
        let winners = potentialWinners.filter { $0 == potentialWinners[0] }
        
        return winners
    }
}
