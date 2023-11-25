//
//  ProgramViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/26.
//

import UIKit

import SnapKit
import Then

final class ProgramViewController: BaseViewController {
    
    //MARK: - UI Components
    
    private var programData: [ProgramModel] = [] {
        didSet {
            rootView.programCollectionView.reloadData()
        }
    }
    private let rootView = ProgramView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        delegate()
        requestProgramAPI(type: "VOLUNTEERING")
    }
    
    private func target() {
        rootView.programTopView.voluteerButton.addTarget(self, action: #selector(voluteerButtonDidTap), for: .touchUpInside)
        
        rootView.programTopView.employmentButton.addTarget(self, action: #selector(employmentButtonDidTap), for: .touchUpInside)
        
        rootView.programTopView.statusSupportButton.addTarget(self, action: #selector(statusSupportButtonDidTap), for: .touchUpInside)
    }
    private func delegate() {
        rootView.programCollectionView.delegate = self
        rootView.programCollectionView.dataSource = self
    }
    
    //MARK: - Action Method
    
    @objc func voluteerButtonDidTap() {
        requestProgramAPI(type: "VOLUNTEERING")
    }
    @objc func employmentButtonDidTap() {
        requestProgramAPI(type: "EMPLOYMENT")
    }
    @objc func statusSupportButtonDidTap() {
        let supportViewController = SupportViewController()
        self.navigationController?.pushViewController(supportViewController, animated: true)
    }
    
    private func requestProgramAPI(type: String) {
        MoyaAPI.shared.getProgramData(type: type) { [weak self] result in
            guard let result = self?.validateResult(result) as? [ProgramModel] else { return }
            self?.programData = result
        }
    }
    
}


extension ProgramViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: CGFloat((Device.width - 57) / 2),
            height: 209
        )
    }
}

extension ProgramViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.cellIdentifier, for: indexPath) as! ProgramCollectionViewCell
        return cell
    }
    
    
}
