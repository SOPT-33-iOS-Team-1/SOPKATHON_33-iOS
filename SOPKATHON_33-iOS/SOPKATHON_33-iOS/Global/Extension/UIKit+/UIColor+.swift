//
//  UIColor+.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: alpha)
    }
}

//MARK: - Custom Color

extension UIColor{
    
    class var gray000: UIColor {
        return UIColor(r: 247, g: 248, b: 249)
    }

        class var gray100: UIColor {
        return UIColor(r: 233, g: 235, b: 237)
    }

        class var gray200: UIColor {
        return UIColor(r: 201, g: 205, b: 211)
    }

        class var gray300: UIColor {
        return UIColor(r: 159, g: 164, b: 168)
    }

        class var gray400: UIColor {
        return UIColor(r: 115, g: 120, b: 126)
    }

        class var gray500: UIColor {
        return UIColor(r: 70, g: 76, b: 82)
    }

        class var gray600: UIColor {
        return UIColor(r: 38, g: 40, b: 43)
    }

        class var gray700: UIColor {
        return UIColor(r: 27, g: 29, b: 31)
    }

        class var blue1: UIColor {
        return UIColor(r: 77, g: 76, b: 255)
    }

        class var blue2: UIColor {
        return UIColor(r: 58, g: 58, b: 177)
    }

        class var blue3: UIColor {
        return UIColor(r: 41, g: 41, b: 151)
    }

        class var gray800: UIColor {
        return UIColor(r: 15, g: 15, b: 15)
    }

        class var blue0: UIColor {
        return UIColor(r: 234, g: 233, b: 255)
    }
}
