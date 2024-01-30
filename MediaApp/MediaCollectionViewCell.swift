//
//  MediaCollectionViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = UIImageView()
    let voteAverageLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let overviewLabel = UILabel()

    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    
}

extension MediaCollectionViewCell: CodebaseUI {
    
    func configureHierarchy() {
        contentView.addSubview(view)
        
        view.addSubview(posterImageView)
        view.addSubview(voteAverageLabel)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(overviewLabel)
    }
    
    func configureLayout() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        posterImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view)
            make.height.equalTo(200)
        }
        voteAverageLabel.snp.makeConstraints { make in
            make.leading.bottom.equalTo(posterImageView).inset(10)
            make.height.equalTo(22)
            make.width.equalTo(34) //
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).inset(10)
            make.top.equalTo(posterImageView.snp.bottom).offset(10)
            make.trailing.greaterThanOrEqualTo(view.snp.trailing).inset(10)
            make.height.equalTo(18)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.leading.equalTo(view.snp.leading).inset(10)
            make.height.equalTo(15)

        }
        overviewLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).inset(10)
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.trailing.bottom.equalTo(view).inset(10)
            make.height.greaterThanOrEqualTo(18)
        }
    }
    
    func configureView() {
        
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowColor = UIColor.gray.cgColor
        view.backgroundColor = .systemYellow
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        
        voteAverageLabel.font = .systemFont(ofSize: 13)
        voteAverageLabel.backgroundColor = .white
        voteAverageLabel.textColor = .black
        voteAverageLabel.textAlignment = .center
        voteAverageLabel.layer.cornerRadius = 10
        voteAverageLabel.clipsToBounds = true
        
        nameLabel.font = .systemFont(ofSize: 15)
        
        dateLabel.font = .systemFont(ofSize: 12)
        
        overviewLabel.font = .systemFont(ofSize: 13)
        overviewLabel.numberOfLines = 3
    }
}
