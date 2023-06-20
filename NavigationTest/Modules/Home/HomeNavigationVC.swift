//
//  HomeNavigationVC.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class HomeNavgationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
    
}

extension HomeNavgationVC: NavigationController {
    var name: String { "Главная" }
}
