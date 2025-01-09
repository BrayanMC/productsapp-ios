//
//  MockProductsViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

class MockProductsViewModel: ProductsViewModel {
    var fetchProductsCalled = false
    
    override func fetchProducts() {
        fetchProductsCalled = true
    }
}
