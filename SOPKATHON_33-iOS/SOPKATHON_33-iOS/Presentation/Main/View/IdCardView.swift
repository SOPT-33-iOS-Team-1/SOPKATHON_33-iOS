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
    
    private let backgroundImageView = UIImageView()
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
            $0.frame = CGRect(x: 0, y: 0, width: 335, height: 185)
        }

        backgroundImageView.do {
            $0.image = Image.profileCard
            $0.contentMode = .scaleAspectFill
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
            $0.text = "단순절도죄"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14.adjusted)
        }
        
        userCrimeYearAgo.do {
            $0.text = "3년 전"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14.adjusted)
            $0.textColor = .gray400
        }
        
        userImageView.do {
            $0.image = Image.profile
        }
        
        editProfileButton.do {
            $0.setImage(Image.camera, for: .normal)
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubview(backgroundImageView)
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

        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50.adjusted)
            $0.leading.equalToSuperview().inset(35.adjusted)
        }
        
        ageChipView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(83.adjusted)
            $0.leading.equalToSuperview().inset(35.adjusted)
            $0.width.equalTo(ageChipView.labelWidth)
        }
        
        genderChipView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(83.adjusted)
            $0.leading.equalTo(ageChipView.snp.trailing).offset(7.adjusted)
            $0.width.equalTo(genderChipView.labelWidth)
        }

        userCrimeHistory.snp.makeConstraints {
            $0.top.equalToSuperview().inset(119)
            $0.leading.equalToSuperview().inset(35)
        }
        
        userCrimeYearAgo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(118)
            $0.leading.equalTo(userCrimeHistory.snp.trailing).offset(10.adjusted)
        }
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40.adjusted)
            $0.leading.equalTo(userName.snp.trailing).offset(173.adjusted)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(84.adjusted)
            $0.leading.equalTo(genderChipView.snp.trailing).offset(178.adjusted)
        }
    }
    
    func dataBind(_ data: MainModel?) {
        guard let data else { return }
        userName.text = data.name
        ageChipView.infoLabel.text = "\(data.age)세"
        genderChipView.infoLabel.text = data.gender
        userCrimeHistory.text = data.criminalHistory
        userCrimeYearAgo.text = data.criminalHistoryDate
    }
}
