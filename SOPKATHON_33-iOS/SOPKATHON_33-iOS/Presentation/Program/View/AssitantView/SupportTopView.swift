//
//  SupportTopView.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class SupportTopView: UIView {
    
    // MARK: - Properties
    
    lazy var backButton = UIButton()
    let supportLabel = UILabel()
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hieararchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        backButton.do {
            $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            $0.tintColor = .white
        }
        
        supportLabel.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
            $0.text = "지원 현황"
            $0.textColor = .white
        }
    }
    
    private func hieararchy() {
        self.addSubviews(
            backButton, supportLabel
        )
    }
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.size.equalTo(24)
        }
        
        supportLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(backButton.snp.trailing).offset(10)
        }
    }
}






