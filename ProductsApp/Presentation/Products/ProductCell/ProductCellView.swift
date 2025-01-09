//
//  ProductCellView.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class ProductCellView: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var productAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        configureViewStyles()
        contentView.addTapGesture(self, action: #selector(productButtonTapped(_:)))
    }
    
    func buildCell() {
        titleLabel.text = "Hola"
    }
    
    @objc func productButtonTapped(_ gesture: UITapGestureRecognizer) {
        productAction?()
    }
}

extension ProductCellView: ViewStylerProtocol {
    
    func configureViewStyles() {
        titleLabel.font = .museoSansFont(type: .W500, size: 18)
    }
}
