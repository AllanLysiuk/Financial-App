//
//  MainScreen.swift
//  BudgetApp
//
//  Created by Allan on 15.03.23.
//

import Foundation
import UIKit


final class HomePageVC: UIViewController{
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var viewModel: HomePageViewModelProtocol
    
    init(viewModel: HomePageViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        requiredInit()
    }
    
    private func requiredInit() {
        tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "circle.grid.3x3"), tag: 0)
        navigationController?.tabBarItem = tabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGray4
        setStyleForSectionsAndHeaders()
        viewModel.setUpCollectionView(with: collectionView)
        viewModel.loadData()
    }
    
    private func setStyleForSectionsAndHeaders() {
        let sectionInset: CGFloat = 16
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        
        
       section.contentInsets = NSDirectionalEdgeInsets(top: sectionInset, leading: sectionInset, bottom: sectionInset, trailing: sectionInset)
        
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        let backgroundInset: CGFloat = 50
        backgroundItem.contentInsets = NSDirectionalEdgeInsets(top: backgroundInset, leading: 0, bottom: 0, trailing: 0)
    
  
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionView?.frame.size.width ?? 440) , heightDimension: .estimated(50))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        
        section.decorationItems = [backgroundItem]
        section.boundarySupplementaryItems = [headerItem]
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background")
        collectionView?.collectionViewLayout = layout
    }
}
