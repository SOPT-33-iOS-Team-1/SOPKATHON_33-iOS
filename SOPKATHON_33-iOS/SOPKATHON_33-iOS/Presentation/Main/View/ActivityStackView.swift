//
//  ActivityStackView.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

final class ActivityStackView: UIStackView {
    
    private let volunteerHourItem = ActivityStackViewItem()
    private let programCompletionNumberItem = ActivityStackViewItem()
    private let licenseNumberItem = ActivityStackViewItem()
    
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
        volunteerHourItem.do {
            $0.titleLabel.text = "봉사시간"
            $0.valueLabel.text = "5시간"
            $0.circleImageView.image = Image.ellipse1
        }
        programCompletionNumberItem.do {
            $0.titleLabel.text = "프로그램 이수"
            $0.valueLabel.text = "3개"
            $0.circleImageView.image = Image.ellipse2
        }
        licenseNumberItem.do {
            $0.titleLabel.text = "자격증"
            $0.valueLabel.text = "2개"
            $0.circleImageView.image = Image.ellipse3
        }
    }
    
    private func setHierachy() {
        self.addArrangedSubViews(volunteerHourItem,
                                 programCompletionNumberItem,
                                 licenseNumberItem)
    }
    
    private func setLayout() {
        self.axis = .vertical
        self.spacing = 17.adjusted
    }
}
