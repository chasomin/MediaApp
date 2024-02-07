//
//  SearchResultTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 2/3/24.
//

import UIKit
import SnapKit

final class SearchResultCollectionViewCell: BaseCollectionViewCell {
    
    let posterImageView = PosterImageView(frame: .zero)
    let nameLabel = UILabel()

    override func configureHierarchy() {
        addSubview(posterImageView)
        addSubview(nameLabel)
    }
    
    override func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    override func configureView() {
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 1
        nameLabel.font = .systemFont(ofSize: 13)
        
        posterImageView.layer.cornerRadius = 5
    }
    
    
    func configureCell(data: Result) {
        let url = URL(string: Constants.Image.ImageBaseURL.baseURL + (data.poster ?? ""))
        posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "movieclapper"))
        nameLabel.text = data.name
    }
}
