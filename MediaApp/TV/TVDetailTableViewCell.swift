//
//  TVDetailTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit

class TVDetailTableViewCell: BaseTableViewCell {

    let backdropImageView = UIImageView()
    let posterImageView = UIImageView()
    let titleLabel = UILabel()
    let airDateLabel = UILabel()
    let overviewLabel = UILabel()
    let voteLabel = UILabel()
    let episodeRunTimeLabel = UILabel()
    let genreLabel = UILabel()
    let tvChannelLabel = UILabel()
    let tvChannelImageView = UIImageView()
    
    
    
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

    }
    
    override func configureLayout() {
        backdropImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        posterImageView.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(130)
            make.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(20)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)
        }
        voteLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)
        }
        episodeRunTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(voteLabel.snp.bottom).offset(5)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)
        }
        genreLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(episodeRunTimeLabel.snp.bottom).offset(5)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)
        }
        airDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(genreLabel.snp.bottom).offset(5)
            make.trailing.greaterThanOrEqualToSuperview().inset(20)

        }
        tvChannelLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(airDateLabel.snp.bottom).offset(5)
            make.height.equalTo(30)
        }
        tvChannelImageView.snp.makeConstraints { make in
            make.leading.equalTo(tvChannelLabel.snp.trailing).offset(10)
            make.top.equalTo(airDateLabel.snp.bottom).offset(5)
            make.bottom.equalTo(tvChannelLabel.snp.bottom)
            make.width.equalTo(tvChannelImageView.snp.height)
        }
        overviewLabel.snp.makeConstraints { make in
            
            make.top.equalTo(posterImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
    }
    
    override func configureView() {
        backdropImageView.contentMode = .scaleAspectFill
        backdropImageView.alpha = 0.3
        
        posterImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        
        
        voteLabel.setTVDetailLabel()
        episodeRunTimeLabel.setTVDetailLabel()
        genreLabel.setTVDetailLabel()
        airDateLabel.setTVDetailLabel()
        tvChannelLabel.setTVDetailLabel()
        
        tvChannelImageView.contentMode = .scaleAspectFit

        overviewLabel.numberOfLines = 0
        overviewLabel.setTVDetailLabel()
        
    }
}

extension TVDetailTableViewCell {
    func configureCell(data: Result) {
        let backdropURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.backdrop ?? "")")
        let posterURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.poster ?? "")")
        let tvChannerLogoURL = URL(string: Constants.Image.ImageBaseURL.baseURL + "\(data.networks?.first?.logo_path ?? "")")
        backdropImageView.kf.setImage(with: backdropURL)
        posterImageView.kf.setImage(with: posterURL)
        titleLabel.text = data.titleLabel
        voteLabel.text = data.voteLable
        episodeRunTimeLabel.text = data.runtime
        genreLabel.text = data.genre
        airDateLabel.text = data.airData
        tvChannelLabel.text = data.networks?.first?.nameLabel
        tvChannelImageView.kf.setImage(with: tvChannerLogoURL)
        overviewLabel.text = data.overview
    }
}

    
    

