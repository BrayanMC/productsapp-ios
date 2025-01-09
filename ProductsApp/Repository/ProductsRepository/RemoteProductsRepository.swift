//
//  RemoteProductsRepository.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class RemoteProductsRepository: ProductsRepositoryProtocol {
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchProducts(request: FetchProductsRequest) -> Single<[ProductResponse]> {
        let endpoint = Endpoint.Products.byPagination(offset: request.offset, limit: request.limit)
        return networkManager.request(endpoint.urlString)
    }
    
    func fetchProductDetail(request: FetchProductRequest) -> Single<ProductResponse> {
        let endpoint = Endpoint.Products.productDetailWithId(request.productId)
        return networkManager.request(endpoint.urlString)
    }
}
