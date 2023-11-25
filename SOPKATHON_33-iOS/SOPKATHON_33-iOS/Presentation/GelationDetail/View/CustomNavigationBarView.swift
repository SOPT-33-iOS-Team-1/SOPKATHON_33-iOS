//
//  CustomNavigationBarView.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

import SnapKit

class CustomGelationNavigationView: UIView {
    
    private let gelationViewbackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let gelationViewTitle: UILabel = {
        let label = UILabel()
        label.text = "교화 활동"
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
        self.backgroundColor = .white
    }
    

    private func setLayout() {
        
        addSubviews(gelationViewbackButton, gelationViewTitle)
        
        self.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        gelationViewbackButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(21)
        }
        
        gelationViewTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(gelationViewbackButton.snp.trailing).offset(10)
        }
    }
}

