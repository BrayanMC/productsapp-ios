//
//  MenuViewModel.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class MenuViewModel: BaseViewModel {
    
    private let getBackgroundColorUseCase: GetBackgroundColorUseCase
    private let setBackgroundColorUseCase: SetBackgroundColorUseCase
    
    private let colors: [UIColor] = [.white, .lightGray, .blue, .green, .red]
    
    private(set) var backgroundColor: Observable<UIColor?> = Observable(nil)
    
    init(
        getBackgroundColorUseCase: GetBackgroundColorUseCase,
        setBackgroundColorUseCase: SetBackgroundColorUseCase
    ) {
        self.getBackgroundColorUseCase = getBackgroundColorUseCase
        self.setBackgroundColorUseCase = setBackgroundColorUseCase
        super.init()
        backgroundColor.value = getBackgroundColorUseCase.execute()
    }
    
    func updateBackgroundColor(_ color: UIColor) {
        setBackgroundColorUseCase.execute(color)
        backgroundColor.value = color
    }
    
    func selectRandomColor() {
        let newColor = colors.randomElement() ?? .white
        if backgroundColor.value != newColor {
            updateBackgroundColor(newColor)
        } else {
            selectRandomColor()
        }
    }
    
    func resetColor(with color: UIColor) {
        updateBackgroundColor(color)
    }
}
