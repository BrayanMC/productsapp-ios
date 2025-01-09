//
//  ProductsViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class ProductsViewModel: BaseViewModel {
    
    private let fetchProductsUseCase: FetchProductsUseCase
    private let fetchProductDetailUseCase: FetchProductDetailUseCase
    
    private(set) var products: Observable<[Product]> = Observable([])
    private(set) var product: Observable<Product?> = Observable(nil)
    
    private var currentPage = 0
    private let pageSize = 10
    private var isLoading = false
    
    init(
        fetchProductsUseCase: FetchProductsUseCase,
        fetchProductDetailUseCase: FetchProductDetailUseCase
    ) {
        self.fetchProductsUseCase = fetchProductsUseCase
        self.fetchProductDetailUseCase = fetchProductDetailUseCase
    }
    
    func fetchProducts() {
        guard !isLoading else { return }
        isLoading = true
        
        fetchProductsUseCase.execute(offset: currentPage * pageSize, limit: pageSize)
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
                self.products.value += result
                self.currentPage += 1
                self.isLoading = false
                self.loading.value = false
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                guard let error = error as? APIError else { return }
                self.error.value = error
                self.isLoading = false
                self.loading.value = false
            })
            .disposed(by: disposeBag)
    }
    
    func fetchProductDetail(productId: String) {
        fetchProductDetailUseCase.execute(productId: productId)
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
                self.product.value = result
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                guard let error = error as? APIError else { return }
                self.error.value = error
            })
            .disposed(by: disposeBag)
    }
}
