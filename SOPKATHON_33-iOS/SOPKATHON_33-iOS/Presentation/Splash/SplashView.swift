//
//  SplashView.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

import Then
import SnapKit

class SplashView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setLayout()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.present(TabBarController(), animated: false)
                }
    }
    
    private func setLayout() {
        self.view.addSubview(splashLogo)
        
        splashLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(105)
            $0.top.equalToSuperview().inset(350)
        }
    }
    
    private let splashLogo: UIImageView = {
        let image = UIImageView()
        image.image = Image.logo2
        return image
    }()
}
