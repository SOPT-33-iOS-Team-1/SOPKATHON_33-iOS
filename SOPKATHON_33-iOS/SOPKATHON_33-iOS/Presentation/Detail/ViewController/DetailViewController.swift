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
        view.addSubview(applyView)
        
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
