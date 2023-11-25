//
//  GelationDetailView.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

import Then
import SnapKit

final class  GelationDetailView: BaseViewController {
    
    let customGelationNavigationView = CustomGelationNavigationView()
    var gelationData: GelationModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setCollectionView()
        setCollectionViewLayout()
        requestGelationAPI()
    }
    
    private func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setLayout() {
        self.view.addSubviews(collectionView, customGelationNavigationView)
        
        customGelationNavigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(customGelationNavigationView.snp.bottom)
        }
        
    }
    
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
    
    private func requestGelationAPI() {
        MoyaAPI.shared.getGelationData { [weak self] result in
            guard let result = self?.validateResult(result) as? GelationModel else { return }
            self?.gelationData = result
            self?.collectionView.reloadData()
        }
    }
}

extension GelationDetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: GelationCollectionViewCell.identifier,for: indexPath) as? GelationCollectionViewCell
        else {return UICollectionViewCell()}
        if !(gelationData?.volunteers.isEmpty ?? true) {
            switch indexPath.item {
            case 0:
                item.bindData(title: "봉사 내역", data: gelationData!.volunteers)
            case 1:
                item.bindData(title: "이수 프로그램 내역",data: gelationData!.programs)
            case 2:
                item.bindData(title: "자격증 목록",data: gelationData!.certifications)
            default:
                break
            }
        }
        return item
    }
}
