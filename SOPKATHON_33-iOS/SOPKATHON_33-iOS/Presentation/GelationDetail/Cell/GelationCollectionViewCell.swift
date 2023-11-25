//
//  GelationCollectionViewCell.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

class GelationCollectionViewCell: UICollectionViewCell {
    
    private var backgroundImage = UIImageView()
    private var iconImage = UIImageView()
    private var cardTitle = UILabel()
    private var cardIcon1 = UIImage()
    private var cardIcon2 = UIImage()
    private var cardIcon3 = UIImage()
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
    
    func bindData(
        backgroundImage: UIImage,
        icon: UIImage,
        title: String,
        data: [String]
    ) {
        self.backgroundImage.image = backgroundImage
        self.iconImage.image = icon
        self.cardTitle.text = title
        self.list1.text = data[0]
        self.list2.text = data[1]
        self.list3.text = data[2]
        self.list4.text = data[3]
    }
    
    
    private func setLayout() {
        self.addSubviews(backgroundImage)
        backgroundImage.addSubviews(cardTitle, iconImage, list1, list2, list3, list4)
        
        backgroundImage.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.height.equalTo(205)
            $0.width.equalTo(335)
        }
        
        iconImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(72)
            $0.leading.equalToSuperview().offset(25)
            $0.size.equalTo(12)
        }
        
        cardTitle.snp.makeConstraints {
            $0.leading.equalTo(backgroundImage.snp.leading).inset(25.adjusted)
            $0.top.equalTo(backgroundImage.snp.top).inset(99.adjusted)
            $0.width.equalTo(50)
        }
        
        list1.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(118.adjusted)
            $0.top.equalToSuperview().inset(20.adjusted)
        }
        
        list2.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(118.adjusted)
            $0.top.equalToSuperview().inset(47.adjusted)
        }
        
        list3.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(118.adjusted)
            $0.top.equalToSuperview().inset(74.adjusted)
        }
        
        list4.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(118.adjusted)
            $0.top.equalToSuperview().inset(101.adjusted)
        }
        
        backgroundImage.do {
            $0.frame = CGRect(x: 0, y: 0, width: 335.adjusted, height: 205.adjusted)
            $0.makeCornerRound(radius: 10)
            $0.image = Image.card
        }
        
        cardTitle.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        list1.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .white
        }
        
        list2.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .white
        }
        
        list3.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .white
        }
        
        list4.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
            $0.textColor = .white
        }
        
    }
}
