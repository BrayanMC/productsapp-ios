//
//  MainTabBarController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 8/01/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var viewModel: MainTabBarViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
        setupBindings()
    }
    
    private func setupViewControllers() {
        var viewControllers = [UIViewController]()
        
        for tab in TabBarItem.allCases {
            let viewController = tab.viewController
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = UITabBarItem(
                title: tab.displayTitle.localized,
                image: tab.icon,
                tag: tab.hashValue
            )
            viewControllers.append(navigationController)
        }
        
        self.viewControllers = viewControllers
    }
    
    private func setupTabBarAppearance() {
        let appearance: UITabBarAppearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorManager.shared.secondary
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.museoSansFont(type: .W700, size: 14),
            .foregroundColor: ColorManager.shared.gray
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.museoSansFont(type: .W700, size: 14),
            .foregroundColor: ColorManager.shared.primary
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = ColorManager.shared.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.iconColor = ColorManager.shared.primary
        appearance.stackedLayoutAppearance.selected.titleTextAttributes =  selectedAttributes
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupBindings() {
        viewModel?.backgroundColor.bind({ [weak self] color in
            guard let self = self, let color = color else { return }
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = color
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        })
    }
}
