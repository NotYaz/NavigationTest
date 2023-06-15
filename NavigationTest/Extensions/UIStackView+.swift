//
//  UIStackView+.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation
import UIKit

extension UIStackView {

    convenience init(_ axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat = 0.0,
                     distribution: UIStackView.Distribution = .fill,
                     alignment: UIStackView.Alignment = .fill,
                     views: [UIView] = []) {
        self.init(arrangedSubviews: views)
        self.spacing = spacing
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
    }

}
