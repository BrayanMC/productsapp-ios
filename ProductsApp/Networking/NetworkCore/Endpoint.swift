//
//  Endpoint.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import Foundation

struct Endpoint {
    
    let path: String
    let queryItems: [URLQueryItem]?
    
    var urlString: String {
        var components = URLComponents(string: "https://api.escuelajs.co/api/v1" + path)!
        components.queryItems = queryItems
        return components.url!.absoluteString
    }
    
    var url: URL {
        return URL(string: urlString)!
    }
    
    // MARK: Products
    struct Products {
        static func byPagination(offset: Int, limit: Int) -> Endpoint {
            return Endpoint(path: "/products", queryItems: [
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "limit", value: "\(limit)")
            ])
        }
        
        static func productDetailWithId(_ productId: String) -> Endpoint {
            return Endpoint(path: "/products/\(productId)", queryItems: nil)
        }
    }
}
