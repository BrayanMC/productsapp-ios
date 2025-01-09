//
//  MainTabBarViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class MainTabBarViewModel: BaseViewModel {
    
    private let getBackgroundColorUseCase: GetBackgroundColorUseCase
    
    private(set) var backgroundColor: Observable<UIColor?> = Observable(nil)
    
    init(getBackgroundColorUseCase: GetBackgroundColorUseCase) {
        self.getBackgroundColorUseCase = getBackgroundColorUseCase
        super.init()
        backgroundColor.value = getBackgroundColorUseCase.execute()
    }
}
