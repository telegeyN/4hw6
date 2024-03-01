//
//  Font.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 29/02/24.
//

import UIKit

enum Fonts: String {
    case bold = "Urbanist-Bold"
    case semiBold = "Urbanist-SemiBold"
    case regular = "Urbanist-Regular"
    case medium = "Urbanist-Medium"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
