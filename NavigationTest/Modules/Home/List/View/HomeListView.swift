//
//  HomeListView.swift
//  NavigationTest
//
//  Created by Ivan Kozlov on 08.06.2023.
//

import UIKit

final class HomeListView: UIViewController, ViewProtocol {
    
    var interactor: HomeListInteractor?
    
    init(interactor: HomeListInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.setup(with: "Okko")
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(CatalogueViewCell.self, forCellWithReuseIdentifier: CatalogueViewCell.reuseIdentifier)
        collectionView.register(HeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        view.add(subviews: headerView, collectionView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 52.0),
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24.0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }

    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
              layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
              
              let seperateFlow = true
              
              let columns = 5
              
              let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .fractionalHeight(1.0))
              let item = NSCollectionLayoutItem(layoutSize: itemSize)
              item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
              
              let groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.2)

              let widthFraction:CGFloat = (sectionIndex == 0) ? 1 : 0.9
              
              let groupSizeWidth:CGFloat = seperateFlow ? (widthFraction * 2) : 1
              
              let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupSizeWidth),
                                                     heightDimension: groupHeight)
              let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
              
              let section = NSCollectionLayoutSection(group: group)
              if seperateFlow {
                  section.orthogonalScrollingBehavior = .continuous
              }
            
              section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
               
              // Set the header for the section
              let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(12.0))
              let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

              section.boundarySupplementaryItems = [header]
            
              return section
          }
          return layout
    }
    
}

extension HomeListView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogueViewCell.reuseIdentifier, for: indexPath) as? CatalogueViewCell else { return CatalogueViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? HeaderCollectionView else { return UICollectionReusableView() }
        let headerArray = ["Новое в подписке", "Посмотреть когда хочется", "Лучшее в магазине", "Жанры", "Сейчас смотрят", "Okko Originals", "Подборки", "Новые сериалы"]
        header.titleLabel.text = headerArray[indexPath.section]
        return header
    }
}

extension HomeListView {

    final class HeaderCollectionView: UICollectionReusableView {
        
        let titleLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            add(subviews: titleLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}

extension HomeListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.didSelectItem(indexPath)
    }
}
