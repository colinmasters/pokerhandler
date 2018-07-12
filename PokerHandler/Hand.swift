//
//  Hand.swift
//  PokerHandler
//
//  Created by Colin Masters on 2018-04-30.
//  Copyright © 2018 iqmetrix. All rights reserved.
//

class Hand {
    
    let player   : String
    var cards    : [Card]
    var strength : Strength
    
    init(player: String, cards: [Card]) {
        self.player = player
        self.cards = cards
        self.strength = .highCard
        self.evaluateStrength()
    }
    
    /* Evaluates the strength of a hand on initilisation and includes only a subset of available hands
     * Assumes that hands are created fairly from a 52 card deck and does not check for duplicates
     */
    func evaluateStrength() {
        let rankRef = Dictionary(grouping: self.cards, by: { $0.rank })
        
        let pairs = rankRef.filter { $1.count == 2 }
        
        if pairs.count == 1 {
            strength = .pair
        }
        
        let tofak = rankRef.filter { $1.count == 3 }
        
        if tofak.count == 1 {
            strength = .threeOfAKind
        }
        
        let suitRef = Dictionary(grouping: self.cards, by: { $0.suit })
        
        let flush = suitRef.filter { $1.count == 5 }
        
        if flush.count == 1 {
            strength = .flush
        }
    }
}

enum Strength : Int {
    case highCard, pair, threeOfAKind, flush
}

extension Hand : Equatable {
    public static func ==(lhs: Hand, rhs: Hand) -> Bool {
        let _ = lhs.cards.sorted(by: >)
        let _ = rhs.cards.sorted(by: >)
        
        for (lhsCard, rhsCard) in zip(lhs.cards, rhs.cards) {
            if lhsCard.rank != rhsCard.rank {
                return false
            }
        }
        return true
    }
}

extension Hand: Comparable {
    public static func <(lhs: Hand, rhs: Hand) -> Bool {
        let lhsCards = lhs.cards.sorted(by: >)
        let rhsCards = rhs.cards.sorted(by: >)
        
        for (lhsCard, rhsCard) in zip(lhsCards, rhsCards) {
            if lhsCard.rank == rhsCard.rank { continue }
            return lhsCard < rhsCard
        }
        return false
    }
}
