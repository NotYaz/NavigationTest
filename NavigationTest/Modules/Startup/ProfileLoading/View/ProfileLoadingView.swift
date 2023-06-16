//
//  ProfileLoadingView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import PinLayout

final class ProfileLoadingView: UIViewController, ViewProtocol {

    weak var interactor: ProfileLoadingInteractor?

    let spinner = NVActivityIndicatorView(frame: CGRect(x: .zero, y: .zero, width: 80, height: 80),
                                          type: .circleStrokeSpin,
                                          color: UIColor(named: "Main Blueberry"),
                                          padding: .zero)
    
    init(interactor: ProfileLoadingInteractor) {
        self.interactor = interactor

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Background Solid Primary")
        
        view.add(subviews: spinner)
        
        spinner.pin
            .center()
            .size(80)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        spinner.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        spinner.stopAnimating()
    }

}
