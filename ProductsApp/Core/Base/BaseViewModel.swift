//
//  BaseViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import RxSwift

class BaseViewModel {
    private(set) var loading: Observable<Bool> = Observable(false)
    private(set) var error: Observable<APIError?> = Observable(nil)
    
    public let disposeBag = DisposeBag()
}
