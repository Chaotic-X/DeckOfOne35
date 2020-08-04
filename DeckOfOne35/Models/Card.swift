//
//  Card.swift
//  DeckOfOne35
//
//  Created by Alex Lundquist on 8/4/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
  let cards: [Card]
}

struct Card: Decodable {
  
  let value: String
  let suit: String
  let image: URL
  
}

