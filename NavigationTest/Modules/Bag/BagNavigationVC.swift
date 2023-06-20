//
//  BagNavigationVC.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import UIKit

final class BagNavigationVC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
}

extension BagNavigationVC: NavigationController {
    var name: String { "Мое" }
}
