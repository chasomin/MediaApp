//
//  TrendViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit
import Kingfisher

class TrendViewController: UIViewController {
    let manager = TrendAPIManager()

    @IBOutlet var tableView: UITableView!
    
    var data: [Result] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        
        manager.callRequest { data in
            self.data = data
        }
        
        let xib = UINib(nibName: TrendTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TrendTableViewCell.id)

    }
    
//https://image.tmdb.org/t/p/<이미지 크기>/<이미지 파일명>
        //https://image.tmdb.org/t/p/original
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = "https://image.tmdb.org/t/p/original\(data[indexPath.row].backdropPath)"
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.id, for: indexPath) as! TrendTableViewCell
        
        cell.mediaTypeLabel.text = data[indexPath.row].mediaType
        cell.nameLabel.text = data[indexPath.row].title ?? data[indexPath.row].name
        cell.dateLabel.text = data[indexPath.row].releaseDate ?? data[indexPath.row].firstAirDate
        cell.overviewLabel.text = data[indexPath.row].overview
        cell.posterImageView.kf.setImage(with: URL(string: url))
        cell.voteAverageLabel.text = "\(data[indexPath.row].voteAverage)"
        
        return cell
    }
    
    
}
