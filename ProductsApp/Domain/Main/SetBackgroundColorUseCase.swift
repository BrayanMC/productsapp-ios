//
//  SetBackgroundColorUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class SetBackgroundColorUseCase {
    
    private let repository: ColorRepositoryProtocol
    
    init(repository: ColorRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(_ color: UIColor) {
        repository.setBackgroundColor(color)
    }
}
