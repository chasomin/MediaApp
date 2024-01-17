//
//  TrendTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    @IBOutlet var mediaTypeLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var voteAverageLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!

    @IBOutlet var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }


    
}

extension TrendTableViewCell {
    
    func setUI() {
        selectionStyle = .none
        
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowColor = UIColor.gray.cgColor
        mediaTypeLabel.font = .boldSystemFont(ofSize: 17)
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 15
        posterImageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        posterImageView.clipsToBounds = true
        
        voteAverageLabel.font = .systemFont(ofSize: 13)
        voteAverageLabel.backgroundColor = .white
        voteAverageLabel.textColor = .black
        
        nameLabel.font = .systemFont(ofSize: 15)
        
        dateLabel.font = .systemFont(ofSize: 12)
        
        overviewLabel.font = .systemFont(ofSize: 13)
        overviewLabel.numberOfLines = 3
    }
}
