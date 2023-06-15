//
//  ProfileSelectionView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 15.06.2023.
//

import Foundation
import UIKit
import PinLayout

final class ProfileSelectionView: UIViewController, ViewProtocol {
    
    weak var interactor: ProfileSelectionInteractor?
    
    private let titleLabel = UILabel(font: .systemFont(ofSize: 22.0, weight: .bold),
                                     color: .white,
                                     text: "Кто будет смотреть Окко?",
                                     alignment: .left)
    
    private let baseTitleProfile = UILabel(font: .systemFont(ofSize: 12.0, weight: .bold),
                                           color: .white,
                                           text: "Основной профиль",
                                           alignment: .center)
    
    private let kidsTitleProfile = UILabel(font: .systemFont(ofSize: 12.0, weight: .bold),
                                           color: .white,
                                           text: "Детский профиль",
                                           alignment: .center)
    
    private let appendTitleProfile = UILabel(font: .systemFont(ofSize: 12.0, weight: .bold),
                                           color: .white,
                                           text: "Добавить профиль",
                                           alignment: .center)
    
    private lazy var profilesStackView = UIStackView(.horizontal,
                                                     spacing: 16.0,
                                                     distribution: .fillEqually,
                                                     views: [baseProfileStackView,
                                                             kidsProfileStackView,
                                                             appendProfileStackView])
    
    private lazy var baseProfileStackView = UIStackView(.vertical,
                                                 spacing: 8.0,
                                                 distribution: .fill,
                                                 views: [baseProfileView, baseTitleProfile])
    
    private lazy var kidsProfileStackView = UIStackView(.vertical,
                                                 spacing: 8.0,
                                                 distribution: .fill,
                                                 views: [kidsProfileView, kidsTitleProfile])
    
    private lazy var appendProfileStackView = UIStackView(.vertical,
                                                 spacing: 8.0,
                                                 distribution: .fill,
                                                 views: [appendProfileView, appendTitleProfile])

    private lazy var baseProfileView: UIButton = {
        let button = UIButton(backgroundColor: .red)
        button.layer.cornerRadius = 50.0
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapProfile(_:)), for: .touchUpInside)
       return button
    }()
    
    private lazy var kidsProfileView: UIButton = {
        let button = UIButton(backgroundColor: .blue)
        button.layer.cornerRadius = 50.0
        button.layer.masksToBounds = true
       return button
    }()
    
    private lazy var appendProfileView: UIButton = {
        let button = UIButton(backgroundColor: .green)
        button.layer.cornerRadius = 50.0
        button.layer.masksToBounds = true
       return button
    }()
    
    init(interactor: ProfileSelectionInteractor) {
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
        
        view.backgroundColor = UIColor(named: "Background Base")
        
        view.add(subviews: titleLabel, profilesStackView)
        
        titleLabel.pin
            .top(view.pin.safeArea.top + 100.0)
            .left(22.0)
            .sizeToFit()
        
        profilesStackView.pin
            .below(of: titleLabel)
            .marginTop(32.0)
            .horizontally(22.0)
            .height(135.0)

    }
    
    @objc func didTapProfile(_ sender: UIButton) {
        interactor?.showProfileLoading()
    }

}
