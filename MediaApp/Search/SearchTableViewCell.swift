//
//  SearchTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 2/5/24.
//

import UIKit
import SnapKit

final class SearchTableViewCell: BaseTableViewCell {

    let label: UILabel = {
       let view = UILabel()
        view.font = .systemFont(ofSize: 13)
        view.textAlignment = .left
        view.numberOfLines = 1
        view.textColor = .white
        return view
    }()
    
    let deleteButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    
    override func configureHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(deleteButton)
    }
    
    override func configureLayout() {
        label.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalTo(label.snp.trailing).offset(10)
        }
    }
    override func configureView() {
        selectionStyle = .none
        backgroundColor = .black
    }
}
