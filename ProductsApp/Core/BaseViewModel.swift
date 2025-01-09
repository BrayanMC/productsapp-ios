//
//  BaseViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

class BaseViewModel {
    private(set) var loading: Observable<Bool> = Observable(nil)
    private(set) var error: Observable<APIError> = Observable(nil)
}
