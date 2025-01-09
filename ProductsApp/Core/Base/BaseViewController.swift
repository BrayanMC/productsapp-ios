//
//  BaseViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    func showErrorAlert(error: APIError) {
        let alertController = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
