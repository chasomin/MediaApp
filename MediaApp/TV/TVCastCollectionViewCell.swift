//
//  TVRecommandationCollectionViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit
import Kingfisher

class TVCastCollectionViewCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
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
    
    
    override func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)

    }
    
    override func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView)
            make.top.equalTo(contentView).inset(10)
            make.height.equalTo(130)
            make.width.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.horizontalEdges.equalTo(contentView)
        }
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.horizontalEdges.equalTo(contentView)
        }
    }
}

extension TVCastCollectionViewCell {
    func configureCell(data: AggregateCredits, index: Int) {
        let url = Constants.Image.ImageBaseURL.baseURL + (data.cast[index].profile ?? "")
        
        imageView.kf.setImage(with: URL(string: url))
        nameLabel.text = data.cast[index].name
        roleLabel.text = data.cast[index].roles.first?.character

    }
}

