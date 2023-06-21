//
//  CommonViewCell.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 21.06.2023.
//

import Foundation
import UIKit

final class CommonViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "commonViewCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .red
    }
}
