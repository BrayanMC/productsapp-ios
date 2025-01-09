//
//  ProductDetailViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class ProductDetailViewController: BaseViewController, Storyboarded, BackButtonConfigurable {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    var viewModel: ProductDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    private func setupView() {
        configureViewStyles()
        setupNavigation()
        addBackButton(action: #selector(backButtonTapped))
    }
    
    private func setupNavigation() {
        configureNavigationBar(isHidden: true)
    }
    
    private func setupBindings() {
        viewModel?.productDetail.bind { [weak self] result in
            guard let self = self else { return }
            guard let result = result else { return }
            displayDetail(with: result)
        }
    }
    
    private func displayDetail(with product: Product) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        categoryNameLabel.text = product.category.name
        
        if let imageUrl = product.images.first {
            imageView.downloadImageFromURL(with: imageUrl)
        } else {
            imageView.image = UIImage()
        }
        
        var backgroundColor: UIColor = .clear
        
        switch product.category.id {
        case 1:
            backgroundColor = .green
        case 2:
            backgroundColor = .blue
        case 3:
            backgroundColor = .red
        case 4:
            backgroundColor = .purple
        case 5:
            backgroundColor = .gray
        default:
            backgroundColor = .yellow
        }
        
        categoryView.backgroundColor = backgroundColor
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
}

extension ProductDetailViewController: ViewStylerProtocol {
    
    func configureViewStyles() {
        titleLabel.font = .museoSansFont(type: .W700, size: 24)
        descriptionLabel.font = .museoSansFont(type: .W300, size: 18)
        categoryNameLabel.font = .museoSansFont(type: .W500, size: 16)
    }
}
