//
//  BaseView.swift
//  MediaApp
//
//  Created by 차소민 on 2/1/24.
//

import UIKit

class BaseView: UIView, CodebaseUI {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black

        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
}
