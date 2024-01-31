//
//  TVDetailTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit

class TVDetailTableViewCell: UITableViewCell {
    
    let backdropImageView = UIImageView()
    
    let posterImageView = UIImageView()
    
    let titleLabel = UILabel()
    let originalTitleLabel = UILabel()
    let firstAirDateLabel = UILabel()
    let nextEpisodeLabel = UILabel()
    let overviewLabel = UILabel()
    let voteLabel = UILabel()
    let episodeRunTimeLabel = UILabel()
    let genreLabel = UILabel()
    let tvChannelLabel = UILabel()
    let tvChannelImageView = UIImageView()
    
    
    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
