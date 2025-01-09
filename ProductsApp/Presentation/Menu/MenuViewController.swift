//
//  MenuViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class MenuViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var changeColorOptionView: OptionView!
    @IBOutlet weak var resetColorOptionView: OptionView!
    
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
        configureOptionView(
            optionView: changeColorOptionView,
            titleKey: "menuScreen_changeColorOption_title",
            action: { [weak self] in
                self?.viewModel?.selectRandomColor()
            }
        )
        
        configureOptionView(
            optionView: resetColorOptionView,
            titleKey: "menuScreen_resetColorOption_title",
            action: { [weak self] in
                self?.viewModel?.resetColor(with: ColorManager.shared.secondary)
            }
        )
    }

    private func configureOptionView(optionView: OptionView, titleKey: String, action: @escaping () -> Void) {
        let optionViewData = OptionViewData(
            title: titleKey.localized
        )
        
        optionView.displayView(with: optionViewData, action: action)
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
