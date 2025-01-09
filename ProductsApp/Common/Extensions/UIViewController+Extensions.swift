//
//  UIViewController+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

extension UIViewController {
    
    public func configureNavigationBar(isHidden: Bool = false, title: String = "", alignTitleToLeft: Bool = false) {
        guard let navigationController = navigationController else { return }
        navigationController.setNavigationBarHidden(isHidden, animated: false)
        
        if !title.isEmpty {
            if alignTitleToLeft {
                setLeftAlignedNavigationItemTitle(text: title)
            } else {
                navigationItem.title = title
            }
        }
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.white
            appearance.titleTextAttributes = [
                .foregroundColor: ColorManager.shared.body,
                .font: UIFont.museoSansFont(type: .W500, size: 20),
            ]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        } else {
            navigationController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: ColorManager.shared.body,
                NSAttributedString.Key.font: UIFont.museoSansFont(type: .W500, size: 20)
            ]
        }
        navigationController.navigationBar.barTintColor = UIColor.white
        navigationController.navigationBar.tintColor = ColorManager.shared.body
        
        navigationItem.hidesBackButton = true
    }
    
    func setLeftAlignedNavigationItemTitle(text: String) {
        let titleLabel = UILabel()
        titleLabel.textColor = ColorManager.shared.body
        titleLabel.text = text
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.museoSansFont(type: .W500, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow

        let stack = UIStackView(arrangedSubviews: [titleLabel, spacer])
        stack.axis = .horizontal
        
        navigationItem.titleView = stack
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(
                equalTo: stack.leftAnchor,
                constant: CGFloat(24)
            )
        ])
    }
}
