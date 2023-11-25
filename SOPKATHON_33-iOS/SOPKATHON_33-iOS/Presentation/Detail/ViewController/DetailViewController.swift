//
//  DetailViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
    private let backgroundImageView = UIImageView()
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    private let lineView = UIView()
    private let applyView = UIView()
    private lazy var applyButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setNavigation()
        setUI()
    }
    
}

// MARK: - Extensions

extension DetailViewController {
    
    // MARK: - @Functions
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            $0.contentInset = .init(top: 400, left: 0, bottom: 0, right: 0)
        }
        
        titleLabel.do {
            $0.text = "솝트와 함께하는 플로깅 봉사솝트와 함께하는 플로깅 봉사"
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .black
            $0.numberOfLines = 0
        }
        
        bodyLabel.do {
            $0.text = "지역 플로깅을 통해 지역 사회에 기여하세요."
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = .black
            $0.numberOfLines = 0
        }
        
        lineView.do {
            $0.backgroundColor = .black
        }
        
        applyView.do {
            $0.backgroundColor = .white
        }
        
        applyButton.do {
            $0.setTitle("지원하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            $0.backgroundColor = #colorLiteral(red: 0.3766356111, green: 0.4129346013, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setLayout() {
        view.addSubviews(backgroundImageView, scrollView, applyView)
        
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(applyView.snp.top)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(applyView.snp.top)
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
        }
        
        contentView.addSubviews(titleLabel, bodyLabel, lineView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(bodyLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(0.5)
            $0.bottom.equalToSuperview()
        }
        
        applyView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(107)
        }
        
        applyView.addSubview(applyButton)
        
        applyButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    private func setNavigation() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        self.navigationItem.leftBarButtonItem = backButton
    }
}
