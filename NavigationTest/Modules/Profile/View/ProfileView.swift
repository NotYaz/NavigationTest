//
//  ProfileView.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class ProfileView: UIViewController, ViewProtocol {
    
    weak var interactor: ProfileInteractor?
    
    private let profileTitleLabel = UILabel(font: .systemFont(ofSize: 18.0, weight: .bold),
                                            color: .black,
                                            text: "Профиль",
                                            alignment: .left)
    
    private let closeButton: UIButton = {
       let button = UIButton()
       button.setTitle("Закрыть", for: .normal)
       button.setTitleColor(.black, for: .normal)
       button.addTarget(self, action: #selector(didTappedCloseButton(_:)), for: .touchUpInside)
       return button
    }()
    
    private let manageProfilesButton: UIButton = {
       let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Управлять профилями", for: .normal)
       button.setTitleColor(.black, for: .normal)
       button.backgroundColor = .lightGray
       return button
    }()
    
    private lazy var profileLabelsStackView = UIStackView(.horizontal,
                                                          spacing: .zero,
                                                          distribution: .equalCentering,
                                                          alignment: .fill,
                                                          views: [profileTitleLabel, closeButton])
    
    private lazy var profileAvatarsStackView = UIStackView(.horizontal,
                                                           spacing: 25.0,
                                                           distribution: .fillEqually,
                                                           alignment: .center,
                                                           views: [baseProfileView, kidsProfileView, appendProfileView])
    
    private let baseProfileView: UIButton = {
        let button = UIButton(backgroundColor: .red)
        button.layer.cornerRadius = 25.0
        button.layer.masksToBounds = true
       return button
    }()
    
    private let kidsProfileView: UIButton = {
        let button = UIButton(backgroundColor: .blue)
        button.layer.cornerRadius = 25.0
        button.layer.masksToBounds = true
       return button
    }()
    
    private let appendProfileView: UIButton = {
        let button = UIButton(backgroundColor: .green)
        button.layer.cornerRadius = 25.0
        button.layer.masksToBounds = true
       return button
    }()
    
    init(interactor: ProfileInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.add(subviews: profileLabelsStackView,
                           profileAvatarsStackView,
                           manageProfilesButton)
        
        profileLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        profileAvatarsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        profileAvatarsStackView.arrangedSubviews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        }
        
        NSLayoutConstraint.activate([
            profileLabelsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12.0),
            profileLabelsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12.0),
            profileLabelsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12.0),
            
            profileAvatarsStackView.topAnchor.constraint(equalTo: profileLabelsStackView.bottomAnchor, constant: 12.0),
            profileAvatarsStackView.leftAnchor.constraint(equalTo: profileLabelsStackView.leftAnchor, constant: 12.0),
            manageProfilesButton.topAnchor.constraint(equalTo: profileAvatarsStackView.bottomAnchor, constant: 48.0),
            manageProfilesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12.0),
            manageProfilesButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12.0),
            manageProfilesButton.heightAnchor.constraint(equalToConstant: 52.0)
        ])

    }
    
    @objc func didTappedCloseButton(_ sender: UIButton) {
        
    }
    
    
}
