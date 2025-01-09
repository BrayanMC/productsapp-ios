//
//  MockFetchProductsUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class MockFetchProductsUseCase: FetchProductsUseCase {
    
    var result: Single<[Product]>?
    
    override func execute(offset: Int, limit: Int) -> Single<[Product]> {
        if let result = result {
            return result
        } else {
            return .error(APIError(message: "", error: "", code: 0))
        }
    }
}
