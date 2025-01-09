//
//  FetchProductDetailUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class FetchProductDetailUseCase {
    
    private let productsRepository: ProductsRepositoryProtocol
    
    init(productsRepository: ProductsRepositoryProtocol) {
        self.productsRepository = productsRepository
    }
    
    func execute(productId: String) -> Single<Product> {
        let request = FetchProductRequest(productId: productId)
        return productsRepository.fetchProductDetail(request: request)
            .map { Product(from: $0) }
    }
}
