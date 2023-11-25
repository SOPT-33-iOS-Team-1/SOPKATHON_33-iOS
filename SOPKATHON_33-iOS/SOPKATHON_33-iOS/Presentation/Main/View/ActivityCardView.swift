//
//  ActivityCardView.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit
import SnapKit

final class ActivityCardView: UIView {
    
    //MARK: - set Properties
    
    let progressView1 = ProgressView(frame: .init(origin: .zero, size: .init(width: 187,height: 187)))
    
    let progressView2 = ProgressView(frame: .init(origin: .zero, size: .init(width: 145,height: 145)))
    
    let progressView3 = ProgressView(frame: .init(origin: .zero, size: .init(width: 105,height: 105)))
    
    let activityStackView = ActivityStackView()
    private let divisionLine = UIView()
    private let showDetailButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
        self.setHierachy()
        self.setLayout()
        progressView1.ringColor = .blue1
        progressView2.ringColor = .blue2
        progressView3.ringColor = .blue3
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
        self.addSubviews(progressView1,
                         progressView2,
                         progressView3,
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
        
        progressView1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.equalToSuperview().offset(74)
            $0.width.height.equalTo(187)
        }
        progressView2.snp.makeConstraints {
            $0.top.equalTo(progressView1).offset(21)
            $0.leading.equalToSuperview().offset(95)
            $0.width.height.equalTo(145)
        }
        
        progressView3.snp.makeConstraints {
            $0.top.equalTo(progressView2).offset(21)
            $0.leading.equalToSuperview().offset(115)
            $0.width.height.equalTo(105)
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
