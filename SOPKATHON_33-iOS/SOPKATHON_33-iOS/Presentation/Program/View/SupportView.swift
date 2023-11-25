//
//  SupportView.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class SupportView: UIView {
    
    // MARK: - Properties
    
    let supportTopView = SupportTopView()
    let supportCollectionView = SupportCollectionView()
    
    
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
        self.backgroundColor = .gray800
        
        supportCollectionView.do {
            $0.backgroundColor = .gray800
        }
    }
    
    private func hieararchy() {
        self.addSubviews(
            supportTopView,
            supportCollectionView
        )
    }
    
    private func layout() {
        supportTopView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(25)
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        supportCollectionView.snp.makeConstraints {
            $0.top.equalTo(supportTopView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}






