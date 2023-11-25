//
//  IdCardView.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class IdCardView: UIView {
    
    //MARK: - set Properties
    
    private let userName = UILabel()
    private let userCrimeHistory = UILabel()
    private let userCrimeYearAgo = UILabel()
    private let userImageView = UIImageView()
    private let editProfileButton = UIButton()
    
    private let ageChipView = UserInfoChipView()
    private let genderChipView = UserInfoChipView()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - set UI
    
    private func setUI() {
        self.do {
            $0.layer.cornerRadius = 10.adjusted
            $0.backgroundColor = .systemYellow
        }
        
        userName.do {
            $0.text = "최아요"
            $0.font = UIFont(name: "Pretendard-Semibold", size: 18.adjusted)
        }
        
        ageChipView.do {
            $0.infoLabel.text = "23세"
            $0.labelWidth = 42.adjusted
        }
        
        genderChipView.do {
            $0.infoLabel.text = "남성"
            $0.labelWidth = 37.adjusted
        }

        userCrimeHistory.do {
            $0.text = "범죄이력을 입력해주세요."
            $0.font = UIFont(name: "Pretendard-Regular", size: 14.adjusted)
        }
        
        userCrimeYearAgo.do {
            $0.text = "3년 전"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14.adjusted)
            $0.textColor = UIColor(red: 0.451, green: 0.471, blue: 0.494, alpha: 1)
        }
        
        userImageView.do {
            // imageView 원형에 맞추기
            $0.frame = CGRect(x: 0, y: 0, width: 65.adjusted, height: 65.adjusted)
            $0.layer.cornerRadius = $0.frame.height / 2
            $0.clipsToBounds = true
            
            $0.image = UIImage(named: "sample")
        }
        
        editProfileButton.do {
            $0.setImage(UIImage(named: "editProfile"), for: .normal)
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(userName,
                         ageChipView,
                         genderChipView,
                         userCrimeHistory,
                         userCrimeYearAgo,
                         userImageView,
                         editProfileButton)
        
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(185.adjusted)
        }
        
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
        }
        
        ageChipView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
            $0.width.equalTo(ageChipView.labelWidth)
        }
        
        genderChipView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(68.adjusted)
            $0.leading.equalToSuperview().inset(73.adjusted)
            $0.width.equalTo(genderChipView.labelWidth)
        }

        userCrimeHistory.snp.makeConstraints {
            $0.top.equalToSuperview().inset(98.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
        }
        
        userCrimeYearAgo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(98.adjusted)
            $0.leading.equalToSuperview().inset(173.adjusted)
        }
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.adjusted)
            $0.trailing.equalToSuperview().inset(25.adjusted)
            $0.width.equalTo(65.adjusted)
            $0.height.equalTo(65.adjusted)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(69.adjusted)
            $0.leading.equalToSuperview().inset(289.adjusted)
        }
    }
}
