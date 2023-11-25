//
//  GelationData.swift
//  SOPKATHON_33-iOS
//
//  Created by 방민지 on 11/26/23.
//

import UIKit

struct GelationData {
    let backgroundImage: UIImage?
    let cardTitle: String
    let list1: String
    let list2: String
    
    
    init(backgroundImage: UIImage?, cardTitle: String, list1: String, list2: String) {
        self.backgroundImage = backgroundImage
        self.cardTitle = cardTitle
        self.list1 = list1
        self.list2 = list2
    }
}

var gelationData: [GelationData] = [
    .init(backgroundImage: nil , cardTitle: "봉사내역", list1: "봉사내역1", list2: "봉사내역2"),
    .init(backgroundImage: nil , cardTitle: "프로그램\n이수\n목록", list1: "프로그램 이수목록1", list2: "프로그램 이수목록2"),
    .init(backgroundImage: nil , cardTitle: "자격증\n목록", list1: "자격증 목록1", list2: "자격증 목록2")
]
