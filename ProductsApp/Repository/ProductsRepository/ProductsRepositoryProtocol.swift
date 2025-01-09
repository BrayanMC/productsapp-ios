//
//  ProductsRepositoryProtocol.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

protocol ProductsRepositoryProtocol {
    func fetchProducts(request: FetchProductsRequest) -> Single<[ProductResponse]>
    func fetchProductDetail(request: FetchProductRequest) -> Single<ProductResponse>
}
