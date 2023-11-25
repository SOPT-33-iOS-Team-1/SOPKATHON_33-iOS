//
//  MainViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 최서연 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class MainViewController: BaseViewController {
    
    private let logoImageView = UIImageView().then {
        $0.image = Image.logo
    }
    private let backgroundImageView = UIImageView().then {
        $0.image = Image.background
    }
    private var mainData: MainModel?
    private let idCardView = IdCardView()
    private let activityCardView = ActivityCardView()
    private let activityStackView = ActivityStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setHierachy()
        self.setLayout()
        requestMainData()
        activityCardView.progressView1.progressAnimation(duration: 1, value: 0.9)
        activityCardView.progressView2.progressAnimation(duration: 1, value: 0.5)
        activityCardView.progressView3.progressAnimation(duration: 1, value: 0.6)
        
        target()

    }
    
    private func target() {
        activityCardView.showDetailButton.addTarget(self, action: #selector(detailButtonDidTap), for: .touchUpInside)
    }
    
    @objc func detailButtonDidTap() {
        let gelationDetailVC = GelationDetailView()
        self.navigationController?.pushViewController(gelationDetailVC, animated: true)
    }
    
    private func setHierachy() {
        self.view.addSubview(backgroundImageView)
        self.view.addSubviews(logoImageView,
                                        idCardView,
                                        activityCardView)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        idCardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.trailing.equalToSuperview().inset(20.adjusted)
        }
        
        activityCardView.snp.makeConstraints {
            $0.top.equalTo(idCardView.snp.bottom).offset(1.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
            $0.trailing.equalToSuperview().inset(25.adjusted)
            $0.height.equalTo(405.adjusted)
        }
    }
    
    private func requestMainData() {
        MoyaAPI.shared.getMainData { [weak self] result in
            guard let result = self?.validateResult(result) as? MainModel else { return }
            self?.mainData = result
            self?.dataBind()
        }
    }
    
    private func dataBind() {
        DispatchQueue.main.async {
            self.idCardView.dataBind(self.mainData)
            self.activityCardView.activityStackView.dataBind(self.mainData)
        }

    }
}
