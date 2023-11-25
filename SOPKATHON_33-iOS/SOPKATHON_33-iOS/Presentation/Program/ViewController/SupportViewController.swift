//
//  SupportViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class SupportViewController: BaseViewController {
    
    //MARK: - UI Components
    
    var registerData: [RegisterModel] = [] {
        didSet {
            rootView.supportCollectionView.reloadData()
        }
    }
    private let rootView = SupportView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        delegate()
        requestRegisterAPI()
    }
    
    private func requestRegisterAPI() {
        MoyaAPI.shared.getProgramRegisterData() { [weak self] result in
            guard let result = self?.validateResult(result) as? [RegisterModel] else { return }
            self?.registerData = result
        }
    }
    
    private func target() {
        rootView.supportTopView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    private func delegate() {
        rootView.supportCollectionView.delegate = self
        rootView.supportCollectionView.dataSource = self
    }
    
    //MARK: - Action Method
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
}


extension SupportViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: CGFloat((Device.width - 57) / 2),
            height: 209
        )
    }
}

extension SupportViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return registerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SupportCollectionViewCell.cellIdentifier, for: indexPath) as! SupportCollectionViewCell
        if !registerData.isEmpty {
            cell.dataBind(registerData[indexPath.item])
        }
        return cell
    }
    
    
}
