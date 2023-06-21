//
//  CatalogueView.swift
//  NavigationTest
//
//  Created by Даниил Верещагин on 16.06.2023.
//

import UIKit

final class CatalogueView: UIViewController, ViewProtocol {

    weak var interactor: CatalogueInteractor?
    
    init(interactor: CatalogueInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        
        let headerView = HeaderView()
        headerView.setup(with: "Каталог")
        headerView.delegate = self
        headerView.translatesAutoresizingMaskIntoConstraints = false

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(CommonViewCell.self, forCellWithReuseIdentifier: CommonViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white

        view.add(subviews: headerView, collectionView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 52.0),
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -12.0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

extension CatalogueView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 48
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonViewCell.reuseIdentifier, for: indexPath) as? CommonViewCell else { return CommonViewCell() }
        return cell
    }
}

extension CatalogueView: HeaderViewDelegate {

    func didSelectedProfile() {
        interactor?.didSelectProfile()
    }

}

