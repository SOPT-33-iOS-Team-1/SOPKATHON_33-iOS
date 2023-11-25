//
//  DetailViewController.swift
//  SOPKATHON_33-iOS
//
//  Created by 티모시 킴 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: BaseViewController {
    
    // MARK: - Properties
    private var detailData: DetailModel? {
        didSet {
            self.dataBind()
        }
    }
    var id: Int?
    
    private lazy var backButton = UIButton()
    private let backgroundImageView = UIImageView()
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    let titleLabel = UILabel()
    private let lineView = UIView()
    let bodyLabel = UILabel()
    let agencyKeyLabel = UILabel()
    let agencyValueLabel = UILabel()
    let dateKeyLabel = UILabel()
    let dateValueLabel = UILabel()
    let timeKeyLabel = UILabel()
    let timeValueLabel = UILabel()
    let salaryKeyLabel = UILabel()
    let salaryValueLabel = UILabel()
    private let applyView = UIView()
    private lazy var applyButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray700
        setNavigation()
        setUI()
        requestDetailAPI()
    }
    
    func requestDetailAPI() {
        guard let id else { return }
        MoyaAPI.shared.getProgramDetailData(id: id) { [weak self] result in
            guard let result = self?.validateResult(result) as? DetailModel else { return }
            self?.detailData = result
        }
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
        backButton.do {
            $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
            $0.tintColor = .white
            $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        }
        
        
        backgroundImageView.do {
            $0.image = Image.dummy1
            $0.isUserInteractionEnabled = true
        }
        
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            $0.contentInset = .init(top: 225, left: 0, bottom: 0, right: 0)
        }
        
        titleLabel.do {
            $0.text = "솝트와 함께하는 플로깅 봉사솝트와 함께하는 플로깅 봉사"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        lineView.do {
            $0.backgroundColor = .gray500
        }
        
        bodyLabel.do {
            $0.text = "지역 플로깅을 통해 지역 사회에 기여하세요."
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        agencyKeyLabel.do {
            $0.text = "기관명"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        agencyValueLabel.do {
            $0.text = "노인종합지원센터"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        dateKeyLabel.do {
            $0.text = "업로드 날짜"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        dateValueLabel.do {
            $0.text = "11월 08일"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        timeKeyLabel.do {
            $0.text = "봉사 시간"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        timeValueLabel.do {
            $0.text = "8시간"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        salaryKeyLabel.do {
            $0.text = "월급"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        salaryValueLabel.do {
            $0.text = "2,690,000원"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .gray400
            $0.numberOfLines = 0
        }
        
        applyView.do {
            $0.backgroundColor = .gray700
        }
        
        applyButton.do {
            $0.setTitle("지원하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            $0.backgroundColor = #colorLiteral(red: 0.3766356111, green: 0.4129346013, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 8
        }
    }
    
    @objc func backButtonDidTap() {
        if let navigationVC = self.navigationController {
            navigationVC.popViewController(animated: true)
        } else {
            print("없어")
        }
    }
    
    private func setLayout() {
        view.addSubviews(backgroundImageView, scrollView, applyView)
        
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(243)
        }
        
        backgroundImageView.addSubview(backButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.leading.equalToSuperview().inset(17)
            $0.size.equalTo(50)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(applyView.snp.top)
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
        }
        
        contentView.addSubviews(titleLabel, lineView, bodyLabel, agencyKeyLabel, agencyValueLabel, dateKeyLabel, dateValueLabel, timeKeyLabel, timeValueLabel, salaryKeyLabel, salaryValueLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(0.5)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        agencyKeyLabel.snp.makeConstraints {
            $0.top.equalTo(bodyLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        agencyValueLabel.snp.makeConstraints {
            $0.top.equalTo(agencyKeyLabel)
            $0.leading.equalToSuperview().inset(115)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        dateKeyLabel.snp.makeConstraints {
            $0.top.equalTo(agencyKeyLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        dateValueLabel.snp.makeConstraints {
            $0.top.equalTo(dateKeyLabel)
            $0.leading.equalToSuperview().inset(115)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        timeKeyLabel.snp.makeConstraints {
            $0.top.equalTo(dateKeyLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        timeValueLabel.snp.makeConstraints {
            $0.top.equalTo(timeKeyLabel)
            $0.leading.equalToSuperview().inset(115)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        salaryKeyLabel.snp.makeConstraints {
            $0.top.equalTo(timeKeyLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalToSuperview()
        }
        
        salaryValueLabel.snp.makeConstraints {
            $0.top.equalTo(salaryKeyLabel)
            $0.leading.equalToSuperview().inset(115)
            $0.trailing.equalToSuperview().inset(20)
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
    }
    
    func dataBind() {
        guard let data = detailData else { return }
        self.agencyValueLabel.text = data.organizationName
        self.dateValueLabel.text = data.registerAt
        if let salary = data.salary {
            self.salaryValueLabel.text = "\(salary)원"
        }
        if let time = data.hour {
            self.timeValueLabel.text = "\(time)시간"
        }
        
        self.backgroundImageView.kfSetImage(url: data.imageURL)
        self.bodyLabel.text = data.content
        
        if data.programType == "VOLUNTEERING" {
            [salaryKeyLabel, salaryValueLabel].forEach {
                $0.isHidden = true
            }
            
            [timeKeyLabel, timeValueLabel].forEach {
                $0.isHidden = false
            }
        } else {
            [salaryKeyLabel, salaryValueLabel].forEach {
                $0.isHidden = false
            }
            
            [timeKeyLabel, timeValueLabel].forEach {
                $0.isHidden = true
            }
        }
    }
    
}
