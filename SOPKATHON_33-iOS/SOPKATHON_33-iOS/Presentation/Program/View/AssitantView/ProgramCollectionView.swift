//
//  ProgramCollectionView.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//



import UIKit

import SnapKit
import Then

final class ProgramCollectionView: UICollectionView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: .init())
        
        register()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func register() {
//        self.register(
//            MainMoreClubCollectionViewCell.self,
//            forCellWithReuseIdentifier: MainMoreClubCollectionViewCell.cellIdentifier
//        )
    }
    
    private func style() {
        self.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 17
            layout.minimumInteritemSpacing = 17
            
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
        }
    }
}





