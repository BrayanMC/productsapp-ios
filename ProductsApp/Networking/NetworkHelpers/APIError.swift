//
//  APIError.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

struct APIError: Error {
    let message: String
    let error: String
    let code: ErrorCode
}
