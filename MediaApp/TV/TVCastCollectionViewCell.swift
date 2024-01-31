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
        
        configureHierarchy()
        configureLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TVCastCollectionViewCell {
    func configureCell(data: AggregateCredits, index: Int) {
        let url = Constants.Image.ImageBaseURL.baseURL + (data.cast[index].profile_path ?? "")
        
        imageView.kf.setImage(with: URL(string: url))
        nameLabel.text = data.cast[index].name
        roleLabel.text = data.cast[index].roles.first?.character

    }
}

extension TVCastCollectionViewCell: CodebaseUI {
    func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)

    }
    
    func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(20)
            make.top.equalTo(contentView).inset(10)
            make.height.equalTo(120)
            make.width.equalTo(90)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    func configureView() {
        
    }
    
    
}
