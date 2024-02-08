//
//  TVDetailTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit
import Kingfisher

final class TVDetailTableViewCell: BaseTableViewCell {

    
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
    let videoButton = UIButton()
    
    let gesture = UIPanGestureRecognizer()
    let dismissButton = UIButton()

    let vStackView = UIStackView()
    let hStackView = UIStackView()
    
    override func configureHierarchy() {
        
        contentView.addSubview(backdropImageView)
        contentView.addSubview(vStackView)
        contentView.addSubview(hStackView)
        
        contentView.addSubview(posterImageView)
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(airDateLabel)
        vStackView.addArrangedSubview(voteLabel)
        vStackView.addArrangedSubview(episodeRunTimeLabel)
        vStackView.addArrangedSubview(genreLabel)
        vStackView.addArrangedSubview(hStackView)
        
        hStackView.addArrangedSubview(tvChannelLabel)
        hStackView.addArrangedSubview(tvChannelImageView)
        
        contentView.addSubview(overviewLabel)
        contentView.addGestureRecognizer(gesture)
        contentView.addSubview(dismissButton)
        contentView.addSubview(videoButton)

    }
    
    override func configureLayout() {
        dismissButton.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(20)
        }
        backdropImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(dismissButton.snp.bottom).offset(10)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.4)
        }
        
        vStackView.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.equalTo(posterImageView.snp.top)
            make.trailing.equalToSuperview().inset(20)
            make.height.lessThanOrEqualTo(posterImageView)
            
        }
        voteLabel.snp.makeConstraints { make in
            make.height.equalTo(13)
        }
        genreLabel.snp.makeConstraints { make in
            make.height.equalTo(13)
        }
        airDateLabel.snp.makeConstraints { make in
            make.height.equalTo(13)
        }
        hStackView.snp.makeConstraints { make in
            make.leading.equalTo(vStackView.snp.leading)
            make.height.equalTo(15)
        }

        tvChannelImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
        }
        
        videoButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(contentView).inset(10)
            make.height.equalTo(20)
        }
        
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(10).priority(.required)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(backdropImageView.snp.bottom).inset(10)
        }
    }
    
    override func configureView() {
        dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        dismissButton.tintColor = .white
        
        backdropImageView.alpha = 0.3
        
        vStackView.axis = .vertical
        vStackView.spacing = 5
        vStackView.alignment = .top
        vStackView.distribution = .fillProportionally
        
        hStackView.spacing = 10
        hStackView.axis = .horizontal
        hStackView.alignment = .leading
        
        posterImageView.contentMode = .scaleAspectFit
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2

        voteLabel.setTVDetailLabel()
        voteLabel.numberOfLines = 0
        episodeRunTimeLabel.setTVDetailLabel()
        episodeRunTimeLabel.numberOfLines = 0
        genreLabel.setTVDetailLabel()
        genreLabel.numberOfLines = 0
        airDateLabel.numberOfLines = 0
        airDateLabel.setTVDetailLabel()
        tvChannelLabel.setTVDetailLabel()
        tvChannelLabel.numberOfLines = 0
        
        tvChannelImageView.contentMode = .scaleAspectFit
        tvChannelImageView.backgroundColor = .white
        tvChannelImageView.alpha = 0.5
        tvChannelImageView.layer.cornerRadius = 5

        videoButton.setImage(UIImage(systemName: "play.rectangle"), for: .normal)
        videoButton.tintColor = .white
        
        overviewLabel.numberOfLines = 0
        overviewLabel.setTVDetailLabel()
        overviewLabel.setContentHuggingPriority(.required, for: .vertical)

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
        data.setRuntimeLabel(episodeRunTimeLabel)
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

    
    

