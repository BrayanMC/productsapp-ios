//
//  MockProductsRepository.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class MockProductsRepository: ProductsRepositoryProtocol {
    
    var fetchProductsResult: Single<[ProductResponse]> = .just([])
    var fetchProductDetailResult: Single<ProductResponse> = .just(
        ProductResponse(
            id: 0,
            title: "",
            price: 0.0,
            description: "",
            images: [""],
            creationAt: "",
            updatedAt: "",
            category: ProductResponse.CategoryResponse(
                id: 0,
                name: "",
                image: "",
                creationAt: "",
                updatedAt: ""
            )
        )
    )

    func fetchProducts(request: FetchProductsRequest) -> Single<[ProductResponse]> {
        return fetchProductsResult
    }
    
    func fetchProductDetail(request: FetchProductRequest) -> Single<ProductResponse> {
        return fetchProductDetailResult
    }
}
