//
//  TVDetailTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit
import Kingfisher

class TVDetailTableViewCell: BaseTableViewCell {

    
    let backdropImageView = BackdropImageView(frame: .zero)
    let posterImageView = PosterImageView(frame: .zero)
    let titleLabel = UILabel()
    let airDateLabel = UILabel()
    let overviewLabel = UILabel()
    let voteLabel = UILabel()
    let episodeRunTimeLabel = UILabel()
    let genreLabel = UILabel()
    let tvChannelLabel = UILabel()
    let tvChannelImageView = UIImageView()
    
    let gesture = UIPanGestureRecognizer()
    let dismissButton = UIButton()

    
    override func configureHierarchy() {
        contentView.addSubview(backdropImageView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(airDateLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(voteLabel)
        contentView.addSubview(episodeRunTimeLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(tvChannelLabel)
        contentView.addSubview(tvChannelImageView)
        
        contentView.addGestureRecognizer(gesture)
        contentView.addSubview(dismissButton)

    }
    
    override func configureLayout() {
        dismissButton.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(10)
        }
        backdropImageView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(20)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(130)
            make.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.top)
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(36)
        }
        voteLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(13)
        }
        episodeRunTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(voteLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(13)
        }
        genreLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(episodeRunTimeLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(13)
        }
        airDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(genreLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(13)

        }
        tvChannelLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(airDateLabel.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        tvChannelImageView.snp.makeConstraints { make in
            make.leading.equalTo(tvChannelLabel.snp.trailing).offset(10)
            make.top.equalTo(airDateLabel.snp.bottom).offset(5)
            make.bottom.equalTo(tvChannelLabel.snp.bottom)
            make.width.equalTo(30)
        }
        overviewLabel.snp.makeConstraints { make in
            
            make.top.equalTo(tvChannelImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.greaterThanOrEqualTo(contentView.snp.bottom).inset(20)
        }
    }
    
    override func configureView() {
        dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        dismissButton.tintColor = .white
        
        backdropImageView.alpha = 0.3
        
        posterImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        
        voteLabel.setTVDetailLabel()
        episodeRunTimeLabel.setTVDetailLabel()
        genreLabel.setTVDetailLabel()
        genreLabel.numberOfLines = 1
        airDateLabel.setTVDetailLabel()
        tvChannelLabel.setTVDetailLabel()
        
        tvChannelImageView.contentMode = .scaleAspectFit
        tvChannelImageView.backgroundColor = .white
        tvChannelImageView.alpha = 0.5
        tvChannelImageView.layer.cornerRadius = 5

        overviewLabel.numberOfLines = 4
        overviewLabel.setTVDetailLabel()
        
    }
    
}

extension TVDetailTableViewCell {
    func configureCell(data: Result) {
        let backdropURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.backdrop ?? "")")
        let posterURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.poster ?? "")")
        let tvChannerLogoURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.networks?.first?.logo ?? "")")
        backdropImageView.kf.setImage(with: backdropURL)
        posterImageView.kf.setImage(with: posterURL)
        titleLabel.text = data.titleLabel
        voteLabel.text = data.voteLable
        episodeRunTimeLabel.text = data.runtime
        genreLabel.text = data.genre
        airDateLabel.text = data.airData
        tvChannelLabel.text = data.networks?.first?.nameLabel
        tvChannelImageView.kf.setImage(with: tvChannerLogoURL)
        overviewLabel.text = data.overviewLabel
        
        if data.networks?.first?.logo == nil {
            tvChannelImageView.isHidden = true
        }
    }
}

    
    

