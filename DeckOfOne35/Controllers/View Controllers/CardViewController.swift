//
//  CardViewController.swift
//  DeckOfOne35
//
//  Created by Alex Lundquist on 8/4/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
  //MARK: - Outlets
  @IBOutlet weak var cardImage: UIImageView!
  @IBOutlet weak var suitLabel: UILabel!
  
  //MARK: -LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  //MARK: -Actions
  @IBAction func drawCardButtonTapped(_ sender: UIButton) {
    CardController.fetchCard { [weak self] (result) in
      DispatchQueue.main.async {
        switch result {
          case .success(let card):
            self?.fetchImageAndUpdateViews(for: card)
          case .failure(let error):
            self?.presentErrorToUser(localizedError: error)
        }
      }
    }
  }
  //MARK: -Help methods
  func fetchImageAndUpdateViews(for card: Card) {
    CardController.fetchImage(for: card) { [weak self] (result) in
      DispatchQueue.main.async {
        switch result {
          case .success(let image):
            self?.cardImage.image = image
            self?.suitLabel.text = "\(card.value) of \(card.suit)"
          case .failure(let error):
            self?.presentErrorToUser(localizedError: error)
        }
      }
    }
  }
} //End of CardViewController

//MARK: -Extensions

