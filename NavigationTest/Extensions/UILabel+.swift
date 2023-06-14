//
//  UILabel+.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 14.06.2023.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont? = nil,
                     color: UIColor? = nil,
                     text: String? = nil,
                     alignment: NSTextAlignment = .left,
                     maxLines: Int = 0) {
        self.init()
        self.textAlignment = alignment
        self.font = font
        self.text = text
        self.textColor = color
        self.numberOfLines = maxLines
    }
}
