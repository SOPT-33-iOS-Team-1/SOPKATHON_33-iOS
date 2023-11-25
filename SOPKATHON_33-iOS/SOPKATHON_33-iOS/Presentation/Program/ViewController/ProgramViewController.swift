//
//  ProgramViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

import SnapKit
import Then

final class ProgramViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let rootView = ProgramView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        delegate()
    }
    
    private func target() {
        rootView.programTopView.voluteerButton.addTarget(self, action: #selector(voluteerButtonDidTap), for: .touchUpInside)
        
        rootView.programTopView.employmentButton.addTarget(self, action: #selector(employmentButtonDidTap), for: .touchUpInside)
        
        rootView.programTopView.statusSupportButton.addTarget(self, action: #selector(statusSupportButtonDidTap), for: .touchUpInside)
    }
    private func delegate() {
        
    }
    
    //MARK: - Action Method
    
    @objc func voluteerButtonDidTap() {
        print(#function)
    }
    @objc func employmentButtonDidTap() {
        print(#function)
    }
    @objc func statusSupportButtonDidTap() {
        print(#function)
    }
    
}
