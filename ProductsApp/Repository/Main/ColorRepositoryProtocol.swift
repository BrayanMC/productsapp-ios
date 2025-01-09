//
//  ColorRepositoryProtocol.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

protocol ColorRepositoryProtocol {
    func getBackgroundColor() -> UIColor?
    func setBackgroundColor(_ color: UIColor)
}
