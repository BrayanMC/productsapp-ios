//
//  ProductsViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class ProductsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var productsTableViewHeightCosntraint: NSLayoutConstraint!
    
    private let cellHeight: CGFloat = 30.0
    private let rowSpacing: CGFloat = 16.0
    
    var viewModel: ProductsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        viewModel?.fetchProducts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateProductsTableViewHeight()
    }
    
    private func setupView() {
        prepareTableView()
    }
    
    private func setupBindings() {
        viewModel?.products.bind { [weak self] result in
            guard let self = self else { return }
            if !result.isEmpty {
                productsTableView.reloadData()
                updateProductsTableViewHeight()
            }
        }
        
        viewModel?.error.bind { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                showErrorAlert(error: error)
            }
        }
    }
    
    private func prepareTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
        productsTableView.register(ProductCellView.self)
        productsTableView.separatorStyle = .none
    }
    
    private func updateProductsTableViewHeight() {
        DispatchQueue.main.async {
            self.productsTableViewHeightCosntraint.constant = self.productsTableView.intrinsicContentSize.height
        }
    }
    
    private func navigateToDetail() {
        
    }
}

extension ProductsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - frameHeight - 100 {
            viewModel?.fetchProducts()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // empty
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        rowSpacing
    }
}

extension ProductsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.products.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCellView = tableView.dequeueCell(forIndexPath: indexPath)
        if let products = viewModel?.products.value {
            cell.buildCell(with: products[indexPath.section])
        }
        return cell
    }
}
