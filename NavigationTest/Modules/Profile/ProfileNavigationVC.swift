//
//  ProfileNavigationVC.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class ProfileNavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ProfileNavigationVC: NavigationController {
    var name: String { "Profile" }
}
