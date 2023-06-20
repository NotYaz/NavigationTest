//
//  BagInteractor.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 19.06.2023.
//

import Foundation

final class BagInteractor: InteractorProtocol {
    
    weak var presenter: BagPresenter?
    weak var coordinator: BagCoordinator?
    
    init(presenter: BagPresenter, coordinator: BagCoordinator) {
        self.presenter = presenter
        self.coordinator = coordinator
    }

}
