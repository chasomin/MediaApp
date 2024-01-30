//
//  Identifier.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

extension UITableViewCell {
    static var id: String {
        return self.description()
    }
}

extension UICollectionViewCell {
    static var id: String {
        return self.description()
    }
}
