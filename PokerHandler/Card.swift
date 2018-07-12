//
//  Card.swift
//  PokerHandler
//
//  Created by Colin Masters on 2018-04-30.
//  Copyright © 2018 iqmetrix. All rights reserved.
//

import Foundation

struct Card {
    let suit : Suit
    let rank : Rank
}

enum Suit : Int {
    case hearts, diamonds, spades, clubs
}

enum Rank : Int {
    case two    = 2
    case three  = 3
    case four   = 4
    case five   = 5
    case six    = 6
    case seven  = 7
    case eight  = 8
    case nine   = 9
    case ten    = 10
    case jack   = 11
    case queen  = 12
    case king   = 13
    case ace    = 14
}

extension Card : Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}

extension Card: Comparable {
    public static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.rank.rawValue < rhs.rank.rawValue
    }
}
