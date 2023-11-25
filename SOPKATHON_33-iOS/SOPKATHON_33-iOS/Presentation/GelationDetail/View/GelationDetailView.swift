//
//  GelationDetailView.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

import Then
import SnapKit

final class  GelationDetailView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    private func setStyle() {
        self.view.addSubviews(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
               }
    }
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            $0.backgroundColor = .white
        }
    
    private func setCollectionView() {
            self.collectionView.register(GelationCollectionViewCell.self,
                                         forCellWithReuseIdentifier: GelationCollectionViewCell.identifier)
            
            self.collectionView.dataSource = self
        }
    
    private func setCollectionViewLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: 335, height: 205)
            flowLayout.minimumLineSpacing = 15
            self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        }
}

extension GelationDetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gelationData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: GelationCollectionViewCell.identifier,for: indexPath) as? GelationCollectionViewCell
        else {return UICollectionViewCell()}
        item.bindData(data: gelationData[indexPath.row])
        return item
    }
}




