//
//  ProgramTopView.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

import SnapKit
import Then

final class ProgramTopView: UIView {
    
    // MARK: - Properties
    
    let voluteerButton = UIButton()
    let employmentButton = UIButton()
    let statusSupportButton = UIButton()
    
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
        voluteerButton.do {
            $0.setTitle("봉사", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 20)
            $0.setTitleColor(.black, for: .normal)
        }
        
        employmentButton.do {
            $0.setTitle("취업", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 20)
            $0.setTitleColor(.black, for: .normal)
        }
        
        statusSupportButton.do {
            $0.setTitle("지원현황", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    private func hieararchy() {
        self.addSubviews(
            voluteerButton,
            employmentButton,
            statusSupportButton
        )
    }
    
    private func layout() {
        voluteerButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(35)
            $0.height.equalTo(24)
        }
        
        employmentButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(voluteerButton.snp.trailing).offset(20)
            $0.width.equalTo(35)
            $0.height.equalTo(24)
        }
        
        statusSupportButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(49)
            $0.height.equalTo(17)
        }
    }
}





