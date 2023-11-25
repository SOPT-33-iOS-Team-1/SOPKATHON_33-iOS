//
//  UserInfoChipView.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class UserInfoChipView: UIView {
    
    var labelWidth: Int = 0
    var infoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder: NSCoder) has not been implemented")
    }
    
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .blue0
            $0.layer.cornerRadius = 7
        }
        
        infoLabel.do {
            $0.font = UIFont(name: "Pretendard-Regular", size: 12.adjusted)
            $0.textColor = .blue3
        }
    }
    
    private func setHierachy() {
        self.addSubview(infoLabel)
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(22.adjusted)
        }
        infoLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
