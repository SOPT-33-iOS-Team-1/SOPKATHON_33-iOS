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
            $0.valueLabel.text = ""
        }
        programCompletionNumberItem.do {
            $0.titleLabel.text = "프로그램 이수"
            $0.valueLabel.text = ""
        }
        licenseNumberItem.do {
            $0.titleLabel.text = "자격증"
            $0.valueLabel.text = ""
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
    
    func dataBind(_ data: MainModel?) {
        guard let data else { return }
        volunteerHourItem.valueLabel.text = "\(data.volunteerHours)시간"
        programCompletionNumberItem.valueLabel.text = "\(data.completedProgramCount)개"
        licenseNumberItem.valueLabel.text = "\(data.certificateCount)개"
    }
}
