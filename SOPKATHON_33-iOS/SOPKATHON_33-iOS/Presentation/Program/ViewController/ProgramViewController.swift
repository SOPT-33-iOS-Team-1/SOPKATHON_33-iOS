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
        rootView.programTopView.voluteerButton.setTitleColor(.white, for: .normal)
        rootView.programTopView.employmentButton.setTitleColor(.gray500, for: .normal)
    }
    @objc func employmentButtonDidTap() {
        requestProgramAPI(type: "EMPLOYMENT")
        rootView.programTopView.voluteerButton.setTitleColor(.gray500, for: .normal)
        rootView.programTopView.employmentButton.setTitleColor(.white, for: .normal)
    }
    @objc func statusSupportButtonDidTap() {
        print(#function)
    }
    
    private func requestProgramAPI(type: String) {
        MoyaAPI.shared.getProgramData(type: type) { [weak self] result in
            guard let result = self?.validateResult(result) as? [ProgramModel] else { return }
            self?.programData = result
        }
    }
    
    private func pushProgramDetailVC(id: Int) {
        let programDetailVC = DetailViewController()
        programDetailVC.id = id
        self.navigationController?.pushViewController(programDetailVC, animated: true)
    }
    
}


extension ProgramViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: CGFloat((Device.width - 57) / 2),
            height: 209
        )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀이 선택됐을 때 실행되는 함수
        let selectedItemId = programData[indexPath.item].programID
        pushProgramDetailVC(id: selectedItemId)
        
    }
}

extension ProgramViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.cellIdentifier, for: indexPath) as! ProgramCollectionViewCell
        if !programData.isEmpty {
            cell.dataBind(programData[indexPath.item])
        }
        return cell
    }
}
