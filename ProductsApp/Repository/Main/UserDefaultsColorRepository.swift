//
//  UserDefaultsColorRepository.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

class UserDefaultsColorRepository: ColorRepositoryProtocol {
    
    func getBackgroundColor() -> UIColor? {
        return UserDefaults.standard.colorForKey(key: UserDefaultsKeys.tabBarBackgroundColor)
    }
    
    func setBackgroundColor(_ color: UIColor) {
        UserDefaults.standard.setColor(color: color, forKey: UserDefaultsKeys.tabBarBackgroundColor)
    }
}
