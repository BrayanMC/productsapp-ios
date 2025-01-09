//
//  ProductCellView.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class ProductCellView: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedProduct: Product?
    var productAction: ((Product) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        configureViewStyles()
        contentView.addTapGesture(self, action: #selector(productButtonTapped(_:)))
    }
    
    func buildCell(with product: Product) {
        selectedProduct = product
        titleLabel.text = product.title
    }
    
    @objc func productButtonTapped(_ gesture: UITapGestureRecognizer) {
        guard let product = selectedProduct else { return }
        
        productAction?(product)
    }
}

extension ProductCellView: ViewStylerProtocol {
    
    func configureViewStyles() {
        titleLabel.font = .museoSansFont(type: .W500, size: 18)
    }
}
