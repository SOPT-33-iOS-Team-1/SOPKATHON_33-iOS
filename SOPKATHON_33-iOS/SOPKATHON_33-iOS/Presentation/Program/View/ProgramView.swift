//
//  ProgramView.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

import SnapKit
import Then

final class ProgramView: UIView {
    
    // MARK: - Properties
    
    let programTopView = ProgramTopView()
    let programCollectionView = ProgramCollectionView()
    
    
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
        self.backgroundColor = .white
    }
    
    private func hieararchy() {
        self.addSubviews(
            programTopView,
            programCollectionView
        )
    }
    
    private func layout() {
        programTopView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(25)
            $0.width.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        programCollectionView.snp.makeConstraints {
            $0.top.equalTo(programTopView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}





