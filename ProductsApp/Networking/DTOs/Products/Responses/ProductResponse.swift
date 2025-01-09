//
//  ProductResponse.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

struct ProductResponse: Decodable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let images: [String]?
    let creationAt: String?
    let updatedAt: String?
    let category: CategoryResponse?
    
    struct CategoryResponse: Decodable {
        let id: Int?
        let name: String?
        let image: String?
        let creationAt: String?
        let updatedAt: String?
    }
}
