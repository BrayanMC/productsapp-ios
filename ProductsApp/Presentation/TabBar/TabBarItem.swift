//
//  TabBarItem.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case products
    case menu
    
    var viewController: UIViewController {
        switch self {
        case .products:
            let viewController = ProductsViewController.instantiateFromXib()
            viewController.viewModel = ViewModelFactory.makeProductsViewModel()
            return viewController
        case .menu:
            let viewController = MenuViewController.instantiateFromXib()
            viewController.viewModel = ViewModelFactory.makeMenuViewModel()
            return viewController
        }
    }
    
    var displayTitle: String {
        switch self {
        case .products:
            return "mainTabBar_productsItem_title"
        case .menu:
            return "mainTabBar_menuItem_title"
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
