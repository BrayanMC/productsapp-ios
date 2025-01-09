//
//  NibLoadableView.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

public protocol NibLoadableView: AnyObject {
    // empty
}

extension NibLoadableView where Self: UIView {

    public static var nibName: String {
        return String(describing: self)
    }
}

extension UIView: NibLoadableView {
    // empty
}
