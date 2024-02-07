//
//  CircleImageView.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit

class CircleImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
