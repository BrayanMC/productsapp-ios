//
//  UIFonts+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

extension UIFont {
    
    static func museoSansFont(type: MuseoSansFont, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont()
    }
}
