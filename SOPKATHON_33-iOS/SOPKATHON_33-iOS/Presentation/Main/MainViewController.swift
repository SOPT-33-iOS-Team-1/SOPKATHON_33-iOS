//
//  MainViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private let idCardView = IdCardView()
    private let activityCardView = ActivityCardView()
    private let activityStackView = ActivityStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setHierachy()
        self.setLayout()
    }
    
    private func setHierachy() {
        self.view.addSubviews(idCardView,
                              activityCardView)
    }
    
    private func setLayout() {
        idCardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        activityCardView.snp.makeConstraints {
            $0.top.equalTo(idCardView.snp.bottom).offset(15.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}