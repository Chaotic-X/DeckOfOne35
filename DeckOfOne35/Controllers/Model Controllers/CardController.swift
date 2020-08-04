//
//  CardController.swift
//  DeckOfOne35
//
//  Created by Alex Lundquist on 8/4/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

import Foundation
import class UIKit.UIImage

class CardController {
  
  static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
    // 1 - Prepare URL
    guard let url = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1") else { return completion(.failure(.invalidURL))}
    //    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
    //    let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
    //
    // 2 - Contact server
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      // 3 - Handle errors from the server
      if let error = error {
        return completion(.failure(.thrownError(error)))
      }
      // 4 - Check for json data
      guard let data = data else { return completion(.failure(.noData))}
      // 5 - Decode json into a Card
      do {
        let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
        guard let card = topLevelObject.cards.first else { return completion(.failure(.noData))}
        //        let card = try JSONDecoder().decode(Card.self, from: data)
        return completion(.success(card))
      } catch {
        return completion(.failure(.thrownError(error)))
      }
      // 6 - RESUME!
    }.resume() //End of URLSession
  } //End of FetchCard
  
  static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
    
    // 1 - Prepare URL
    let url = card.image
    // 2 - Contact server
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      // 3 - Handle errors from the server
      if let error = error {
        return completion(.failure(.thrownError(error)))
      }
      // 4 - Check for image data
      guard let data = data else { return completion(.failure(.noData))}
      // 5 - Initialize an image from the data
      guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
      return completion(.success(image))
      //6 - RESUME!!!
    }.resume() //end of URLSession
  }
}
