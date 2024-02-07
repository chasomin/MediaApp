//
//  PosterImageView.swift
//  MediaApp
//
//  Created by 차소민 on 2/3/24.
//

import UIKit

final class PosterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFill
        clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
