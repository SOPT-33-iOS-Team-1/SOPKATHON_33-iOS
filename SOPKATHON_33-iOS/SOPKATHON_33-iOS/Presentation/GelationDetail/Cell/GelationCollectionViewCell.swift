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
    private var cardIcon = UIImage()
    private var list1 = UILabel()
    private var list2 = UILabel()
    private var list3 = UILabel()
    private var list4 = UILabel()
    
    static let identifier = "GelationCollectionViewCell"
    
    
    
    private var itemRow: Int?
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setLayout()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func bindData(title: String, data: [String]) {
        self.cardTitle.text = title
        self.list1.text = data[0]
        self.list2.text = data[1]
        self.list3.text = data[2]
        self.list4.text = data[3]
    }
    
    
    private func setLayout() {
        self.addSubviews(backgroundImage)
        backgroundImage.addSubviews(cardTitle, list1, list2, list3, list4)
        
        backgroundImage.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.height.equalTo(205)
            $0.width.equalTo(335)
        }
        
        cardTitle.snp.makeConstraints {
            $0.leading.equalTo(backgroundImage.snp.leading).inset(23.adjusted)
            $0.top.equalTo(backgroundImage.snp.top).inset(85.adjusted)
            $0.width.equalTo(50)
        }
        
        list1.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(20.adjusted)
        }
        
        list2.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(47.adjusted)
        }
        
        list3.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(74.adjusted)
        }
        
        list4.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(150.adjusted)
            $0.top.equalToSuperview().inset(101.adjusted)
        }
        
        backgroundImage.do {
            $0.frame = CGRect(x: 0, y: 0, width: 335.adjusted, height: 205.adjusted)
            $0.backgroundColor = .white
            $0.makeCornerRound(radius: 10)
        }
        
        cardTitle.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .black
            $0.numberOfLines = 0
        }
        
        list1.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        list2.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        list3.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        list4.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
    }
}
