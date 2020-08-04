//
//  UIViewControllerExtension.swift
//  DeckOfOne35
//
//  Created by Alex Lundquist on 8/4/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func presentErrorToUser(localizedError: LocalizedError) {
    
    // Feel free to customize the alert controller.
    let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
    let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
    alertController.addAction(dismissAction)
    present(alertController, animated: true)
  }
}
