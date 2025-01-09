//
//  GetBackgroundColorUseCase.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class GetBackgroundColorUseCase {
    
    private let repository: ColorRepositoryProtocol
    
    init(repository: ColorRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> UIColor {
        return repository.getBackgroundColor() ?? ColorManager.shared.secondary
    }
}
