//
//  UIImageView+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func downloadImageFromURL(with url: String) {
        self.sd_setImage(with: URL(string: url))
    }
}
