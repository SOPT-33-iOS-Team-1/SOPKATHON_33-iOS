//
//  CustomNavigationBarView.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

import SnapKit

class CustomGelationNavigationView: UIView {
    
    private let gelationViewTitle: UILabel = {
        let label = UILabel()
        label.text = "교화 활동"
        label.textColor = .white
        label.font =  UIFont(name: "Pretendard-SemiBold", size: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setLayout()
    }

    private func setStyle() {
        self.backgroundColor = .black
    }
    

    private func setLayout() {
        
        addSubviews(gelationViewTitle)
        
        self.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        gelationViewTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(52)
        }
    }
}

