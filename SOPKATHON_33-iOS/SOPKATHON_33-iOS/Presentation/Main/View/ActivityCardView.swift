//
//  ActivityCardView.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

final class ActivityCardView: UIView {
    
    //MARK: - set Properties
    
    private let ringImageView = UIImageView()
    private let activityStackView = ActivityStackView()
    private let divisionLine = UIView()
    private let showDetailButton = UIButton()
    
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
            $0.backgroundColor = .systemMint
            $0.layer.cornerRadius = 8
        }
        
        ringImageView.do {
            $0.image = UIImage(named: "ring")
        }
        
        divisionLine.do {
            $0.setBorder(borderWidth: 1, borderColor: UIColor(red: 0.914, green: 0.922, blue: 0.929, alpha: 1))
        }
        showDetailButton.do {
            $0.backgroundColor = .clear
            $0.setTitle("상세보기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12.adjusted)
            $0.setTitleColor(UIColor(red: 0.451, green: 0.471, blue: 0.494, alpha: 1), for: .normal)
        }
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        self.addSubviews(ringImageView,
                         activityStackView,
                         divisionLine,
                         showDetailButton)
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(335.adjusted)
            $0.height.equalTo(405.adjusted)
        }
        
        ringImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        activityStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(255.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        divisionLine.snp.makeConstraints {
            $0.top.equalToSuperview().inset(370.adjusted)
            $0.width.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(1.adjusted)
        }
        
        showDetailButton.snp.makeConstraints {
            $0.top.equalTo(divisionLine.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(335.adjusted)
        }
    }
}
