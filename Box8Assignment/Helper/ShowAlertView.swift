//
//  ShowAlertView.swift
//  Box8Assignment
//
//  Created by Sanjay Mali on 15/03/18.
//  Copyright © 2018 Sanjay Mali. All rights reserved.
//

import Foundation
import UIKit
protocol ShowAlertView {
    
}

extension ShowAlertView where Self: UIViewController {
    func showAlert(title: String = "Box8", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showSuccessAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showlogoutAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { action in
            
            
        }))
        alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
