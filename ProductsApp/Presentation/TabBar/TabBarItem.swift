//
//  TabBarItem.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

enum TabBarItem: String, CaseIterable {
    
    case products = "mainTabBar_productsItem_title"
    case menu = "mainTabBar_menuItem_title"
    
    var viewController: UIViewController {
        switch self {
        case .products:
            return UIViewController()
        case .menu:
            return UIViewController()
        }
    }
    
    var displayTitle: String {
        switch self {
        case .products:
            return "Inicio"
        case .menu:
            return "Buscar"
        }
    }

    var icon: UIImage {
        switch self {
        case .products:
            return ImageManager.shared.systemImage(named: "list.bullet") ?? UIImage()
        case .menu:
            return ImageManager.shared.systemImage(named: "gear") ?? UIImage()
        }
    }
}
