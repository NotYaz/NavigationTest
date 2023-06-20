//
//  CatalogueNode.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import Foundation

final class CatalogueNode: NodeProtocol {
    var presenter: CataloguePresenter
    var interactor: CatalogueInteractor
    var view: CatalogueView
    
    weak var coordinator: CatalogueCoordinator?
    
    var showStyle: ShowStyle { .tabbar }
    
    init(coordinator: CatalogueCoordinator) {
        presenter = CataloguePresenter()
        interactor = CatalogueInteractor(presenter: presenter, coordinator: coordinator)
        view = CatalogueView(interactor: interactor)
        presenter.view = view
        
        self.coordinator = coordinator
    }
    
}
