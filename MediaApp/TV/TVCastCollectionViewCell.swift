//
//  TVRecommandationCollectionViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit

class TVCastCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = .boldSystemFont(ofSize: 12)
        view.textColor = .white
        return view
    }()
    let roleLabel: UILabel = {
        
        let view = UILabel()
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 10)
        view.textColor = .white

        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.height.equalTo(120)
            make.width.equalTo(90)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(10)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
