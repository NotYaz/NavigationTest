//
//  ProfileView.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class ProfileView: UIViewController, ViewProtocol {
    
    var interactor: ProfileInteractor
    
    init(interactor: ProfileInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
