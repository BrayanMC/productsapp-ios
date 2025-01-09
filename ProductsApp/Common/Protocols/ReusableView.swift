//
//  ReusableView.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

