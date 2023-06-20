//
//  NavigationController.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import UIKit

protocol NavigationController: UINavigationController {
    var name: String { get }
}

extension NavigationController {
    var name: String { tabBarItem.title ?? "" }
}
