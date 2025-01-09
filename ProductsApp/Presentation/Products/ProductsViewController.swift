//
//  ProductsViewController.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class ProductsViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var productsTableView: UITableView!
    
    private let cellHeight: CGFloat = 30.0
    private let rowSpacing: CGFloat = 16.0
    
    var viewModel: ProductsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        viewModel?.fetchProducts()
    }
    
    private func setupView() {
        prepareTableView()
    }
    
    private func setupBindings() {
        viewModel?.products.bind { [weak self] result in
            guard let self = self else { return }
            if !result.isEmpty {
                productsTableView.reloadData()
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
        productsTableView.alwaysBounceVertical = true
        productsTableView.separatorStyle = .none
    }
    
    public func navigateToDetail(with product: Product) {
        let viewController = ProductDetailViewController.instantiateFromXib()
        let viewData = ProductDetailViewData(product: product)
        viewController.viewModel = ViewModelFactory.makeProductDetailViewModel(with: viewData)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
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
            cell.productAction = { [weak self] product in
                guard let self = self else { return }
                navigateToDetail(with: product)
            }
        }
        return cell
    }
}
