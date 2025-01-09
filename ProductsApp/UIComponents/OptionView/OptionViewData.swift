//
//  OptionViewData.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

public struct OptionViewData {
    let title: String
    let isClickable: Bool
    
    public init(title: String, isClickable: Bool = true) {
        self.title = title
        self.isClickable = isClickable
    }
}
