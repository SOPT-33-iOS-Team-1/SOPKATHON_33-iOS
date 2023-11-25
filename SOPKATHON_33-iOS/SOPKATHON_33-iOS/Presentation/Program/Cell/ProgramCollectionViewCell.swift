//
//  ProgramCollectionViewCell.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

import SnapKit
import Then

final class ProgramCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let areaLabel = UILabel()
    private let updateLabel = UILabel()
    
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
        titleLabel.do {
            $0.text = "프로그램 명을 입력해주세요."
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
        areaLabel.do {
            $0.text = "솝트광역시"
            $0.font = UIFont(name: "Pretendard-regular", size: 12)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        updateLabel.do {
            $0.text = "00.00"
            $0.font = UIFont(name: "Pretendard-regular", size: 12)
            $0.textColor = .black
            $0.textAlignment = .left
        }
        
    }
    
    private func hieararchy() {
        contentView.addSubviews(
            titleLabel,
            areaLabel,
            updateLabel
        )
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(135)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        areaLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
        }
        
        updateLabel.snp.makeConstraints {
            $0.leading.equalTo(areaLabel.snp.trailing).offset(10)
            $0.top.equalTo(areaLabel)
        }
    }
    
    func dataBind() {
    }
}

