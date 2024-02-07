//
//  EditView.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit
import SnapKit

final class EditView: BaseView {
    
    let descriptionLabel = UILabel()
    let textField = UITextField()
        
    
    override func configureHierarchy() {
        addSubview(descriptionLabel)
        addSubview(textField)
    }
    
    override func configureLayout() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(5)
        }
        
        textField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(5)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
    }
    
    override func configureView() {
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.textColor = .lightGray
        
        textField.clearButtonMode = .always
    }
}
