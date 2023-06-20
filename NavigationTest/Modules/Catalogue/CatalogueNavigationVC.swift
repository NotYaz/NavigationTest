//
//  CatalogueNavigationVC.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import UIKit

final class CatalogueNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
        
    }

}

extension CatalogueNavigationVC: NavigationController {
    var name: String { "Каталог" }
}

