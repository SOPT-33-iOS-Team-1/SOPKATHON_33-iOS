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
    
    let customGelationNavigationView = CustomGelationNavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setCollectionView()
        setCollectionViewLayout()
    }
    
    @objc func handleListTap() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        gelationViewbackButton.addTarget(self, action: #selector(handleListTap), for: .touchUpInside)
    }
    
    private func setLayout() {
        self.view.addSubviews(collectionView, customGelationNavigationView)
        customGelationNavigationView.addSubview(gelationViewbackButton)
        
        customGelationNavigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        gelationViewbackButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(21)
        }
        
        collectionView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(customGelationNavigationView.snp.bottom)
               }
        
    }
    
    private let gelationViewbackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            $0.backgroundColor = .black
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
