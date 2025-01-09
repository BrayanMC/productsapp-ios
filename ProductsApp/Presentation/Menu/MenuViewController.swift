//
//  MenuViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class MenuViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var changeColorOptionView: OptionView!
    
    let colors: [UIColor] = [.white, .lightGray, .blue, .green, .red]
    var viewModel: MenuViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    private func setupView() {
        initOptionView()
    }
    
    private func initOptionView() {
        let changeColorOptionViewData = OptionViewData(
            title: "menuScreen_changeColorOption_title".localized
        )
        
        changeColorOptionView.displayView(
            with: changeColorOptionViewData) {
                self.viewModel?.selectRandomColor()
            }
    }
    
    private func setupBindings() {
        viewModel?.backgroundColor.bind({ [weak self] color in
            guard let self = self, let color = color else { return }
            self.updateTabBarAppearance(with: color)
        })
    }
    
    private func updateTabBarAppearance(with color: UIColor) {
        guard let tabBar = self.tabBarController?.tabBar else { return }
                
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
