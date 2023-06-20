//
//  Bag.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class BagNode: NodeProtocol {
    var presenter: BagPresenter
    var interactor: BagInteractor
    var view: BagView
    
    weak var coordinator: BagCoordinator?

    var showStyle: ShowStyle { .tabbar }
    
    init(coordinator: BagCoordinator) {
        presenter = BagPresenter()
        interactor = BagInteractor(presenter: presenter, coordinator: coordinator)
        view = BagView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
}
