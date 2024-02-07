//
//  WhiteCapsuleSmallLabel.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

final class WhiteCapsuleSmallLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .systemFont(ofSize: 13)
        backgroundColor = .white
        textColor = .black
        textAlignment = .center
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
