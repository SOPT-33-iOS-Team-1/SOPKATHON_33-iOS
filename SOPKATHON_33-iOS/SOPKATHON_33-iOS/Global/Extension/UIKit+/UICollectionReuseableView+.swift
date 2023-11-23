//
//  UICollectionReuseableView+.swift
//  SOPKATHON_33-iOS
//
//  Created by 류희재 on 2023/11/24.
//

import UIKit

public extension UICollectionReusableView{
    static var reuseCellIdentifier: String {
        return String(describing: self)
    }
}
