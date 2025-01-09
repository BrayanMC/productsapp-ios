//
//  Strings+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 8/01/25.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: self)
    }
}
