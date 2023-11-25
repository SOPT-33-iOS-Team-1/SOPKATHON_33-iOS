//
//  GelationCollectionViewCell.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

class GelationCollectionViewCell: UICollectionViewCell {
    
    private var backgroundImage = UIView()
    private var cardTitle = UILabel()
    private var list1 = UILabel()
    private var list2 = UILabel()
    
    static let identifier = "GelationCollectionViewCell"
    
    private var itemRow: Int?
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setLayout()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func setLayout() {
        self.addSubviews(backgroundImage, cardTitle, list1, list2)
        
        backgroundImage.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        cardTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(23.adjusted)
            $0.top.equalToSuperview().inset(85.adjusted)
        }
        
        list1.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(20.adjusted)
        }
        
        list2.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(47.adjusted)
        }
        
        backgroundImage.do {
            $0.frame = CGRect(x: 0, y: 0, width: 335.adjusted, height: 205.adjusted)
        }
        
        cardTitle.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        list1.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        list2.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
    }
}
