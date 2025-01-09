//
//  MockFetchProductDetailUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class MockFetchProductDetailUseCase: FetchProductDetailUseCase {
    
    var result: Single<Product>?
    
    override func execute(productId: String) -> Single<Product> {
        if let result = result {
            return result
        } else {
            return .error(APIError(message: "", error: "", code: 0))
        }
    }
}
