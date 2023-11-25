//
//  GelationData.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

struct GelationData {
    let backgroundImage: UIView
    let cardTitle: String
    let cardIcon: String
    let list1: String
    let list2: String
    let list3: String
    let list4: String
    
    
    init(backgroundImage: UIView, cardTitle: String, cardIcon: String, list1: String, list2: String, list3: String, list4: String) {
        self.backgroundImage = backgroundImage
        self.cardTitle = cardTitle
        self.cardIcon = cardIcon
        self.list1 = list1
        self.list2 = list2
        self.list3 = list3
        self.list4 = list4
    }
}

var gelationData: [GelationData] = [
    .init(backgroundImage: UIView() , cardTitle: "봉사 내역", cardIcon: "cardIcon1" , list1: "봉사내역1", list2: "봉사내역2", list3: "봉사내역3", list4: "봉사내역4"),
    .init(backgroundImage: UIView() , cardTitle: "프로그램 이수 목록", cardIcon: "cardIcon1", list1: "프로그램 이수목록1", list2: "프로그램 이수목록2", list3: "프로그램 이수목록3", list4: "프로그램 이수목록4"),
    .init(backgroundImage: UIView() , cardTitle: "자격증 목록", cardIcon: "cardIcon1", list1: "자격증 목록1", list2: "자격증 목록2", list3: "자격증 목록3", list4: "자격증 목록4")
]
