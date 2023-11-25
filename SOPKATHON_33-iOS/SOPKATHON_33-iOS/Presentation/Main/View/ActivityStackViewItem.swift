//
//  ActivityStackViewItem.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

final class ActivityStackViewItem: UIView {
    
    private let circleImageView = UIImageView()
    var titleLabel = UILabel()
    var valueLabel = UILabel()
    
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
        circleImageView.do {
            $0.image = UIImage(named: "circle-small")
        }
        
        titleLabel.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
        
        valueLabel.do {
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14.adjusted)
        }
    }
    
    private func setHierachy() {
        self.addSubviews(circleImageView,
                         titleLabel,
                         valueLabel)
    }
    
    private func setLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(291.adjusted)
            $0.height.equalTo(17.adjusted)
        }
        
        circleImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(circleImageView.snp.trailing).offset(15.adjusted)
        }
        
        valueLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
