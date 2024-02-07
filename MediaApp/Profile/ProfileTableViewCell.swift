//
//  ProfileTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit
import SnapKit

final class ProfileTableViewCell: BaseTableViewCell {
    
    let titleLabel = UILabel()
    let textField = UITextField()
    
    override func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(contentView).inset(10)
            make.width.equalTo(70)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
            make.verticalEdges.trailing.equalTo(contentView).inset(10)
        }
    }
    
    override func configureView() {
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = .white
        
        textField.font = .systemFont(ofSize: 13)
        textField.isEnabled = false
        
    }

}
