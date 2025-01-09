//
//  Product.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

struct Product {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let images: [String]
    let creationAt: String
    let updatedAt: String
    let category: Category
    
    struct Category {
        let id: Int
        let name: String
        let image: String
        let creationAt: String
        let updatedAt: String
    }
}

extension Product {
    
    init(from response: ProductResponse) {
        self.id = response.id ?? 0
        self.title = response.title ?? ""
        self.price = response.price ?? 0.0
        self.description = response.description ?? ""
        self.images = response.images ?? []
        self.creationAt = response.creationAt ?? ""
        self.updatedAt = response.updatedAt ?? ""
        self.category = Category(
            from: response.category ?? ProductResponse.CategoryResponse(
                id: 0,
                name: "",
                image: "",
                creationAt: "",
                updatedAt: ""
            )
        )
    }
}

extension Product.Category {
    
    init(from response: ProductResponse.CategoryResponse) {
        self.id = response.id ?? 0
        self.name = response.name ?? ""
        self.image = response.image ?? ""
        self.creationAt = response.creationAt ?? ""
        self.updatedAt = response.updatedAt ?? ""
    }
}
