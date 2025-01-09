//
//  ProductDetailViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

class ProductDetailViewModel: BaseViewModel {
    
    private let viewData: ProductDetailViewData
    
    private(set) var productDetail: Observable<Product?> = Observable(nil)
    
    init(viewData: ProductDetailViewData) {
        self.viewData = viewData
        productDetail.value = viewData.product
    }
}
