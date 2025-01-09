//
//  ColorManager.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import UIKit

public final class ColorManager {
    
    public static let shared: ColorManager = ColorManager()

    private init() { }
    
    public lazy var secondary: UIColor = {
        return UIColor(named: "secondary", in: Bundle.main, compatibleWith: nil) ?? .clear
    }()
    
    public lazy var primary: UIColor = {
        return UIColor(named: "primary", in: Bundle.main, compatibleWith: nil) ?? .clear
    }()
    
    public lazy var body: UIColor = {
        return UIColor(named: "body", in: Bundle.main, compatibleWith: nil) ?? .clear
    }()
    
    public lazy var label: UIColor = {
        return UIColor(named: "label", in: Bundle.main, compatibleWith: nil) ?? .clear
    }()
}
