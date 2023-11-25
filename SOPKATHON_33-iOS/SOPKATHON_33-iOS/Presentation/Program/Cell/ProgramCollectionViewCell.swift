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
    
    private let backgroundImageView = UIImageView()
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
        contentView.do {
            $0.backgroundColor = .gray700
            $0.makeCornerRound(ratio: 10)
        }
        
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = Image.dummy1
        }
        
        titleLabel.do {
            $0.text = "프로그램 명을 입력해주세요."
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.textColor = .white
            $0.textAlignment = .left
            $0.numberOfLines = 0
        }
        
        areaLabel.do {
            $0.text = "솝트광역시"
            $0.font = UIFont(name: "Pretendard-regular", size: 12)
            $0.textColor = .gray400
            $0.textAlignment = .left
        }
        updateLabel.do {
            $0.text = "00.00"
            $0.font = UIFont(name: "Pretendard-regular", size: 12)
            $0.textColor = .gray400
            $0.textAlignment = .left
        }
        
    }
    
    private func hieararchy() {
        contentView.addSubviews(
            backgroundImageView,
            titleLabel,
            areaLabel,
            updateLabel
        )
    }
    
    private func layout() {
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(115)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(130.adjusted)
            $0.leading.trailing.equalToSuperview().inset(12.adjusted)
        }
        
        areaLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(titleLabel)
        }
        
        updateLabel.snp.makeConstraints {
            $0.leading.equalTo(areaLabel.snp.trailing).offset(10.adjusted)
            $0.top.equalTo(areaLabel)
        }
    }
    
    func dataBind() {
    }
}

