//
//  profileInteractor.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import Foundation

final class ProfileInteractor: InteractorProtocol {
    
    var presenter: ProfilePresenter
    
    init(presenter: ProfilePresenter) {
        self.presenter = presenter
    }
    
}
