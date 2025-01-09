//
//  FetchAllProductsUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class FetchProductsUseCase {
    
    private let productsRepository: ProductsRepositoryProtocol
    
    init(productsRepository: ProductsRepositoryProtocol) {
        self.productsRepository = productsRepository
    }
    
    func execute(offset: Int, limit: Int) -> Single<[Product]> {
        let request = FetchProductsRequest(offset: offset, limit: limit)
        return productsRepository.fetchProducts(request: request)
            .map { responses in
                responses.map { Product(from: $0) }
            }
    }
}
