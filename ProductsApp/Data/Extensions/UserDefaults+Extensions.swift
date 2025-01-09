//
//  UserDefaults+Extensions.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

import Foundation
import UIKit

extension UserDefaults {
    
    func colorForKey(key: String) -> UIColor? {
        guard let data = data(forKey: key) else { return nil }
        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        } catch {
            print("Error unarchiving color data: \(error)")
            return nil
        }
    }

    func setColor(color: UIColor?, forKey key: String) {
        guard let color = color else {
            removeObject(forKey: key)
            return
        }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            set(data, forKey: key)
        } catch {
            print("Error archiving color data: \(error)")
        }
    }
}
