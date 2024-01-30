//
//  TrendViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit
import Kingfisher

class TrendViewController: UIViewController {

    let tableView = UITableView()
    
    var data: [TrendResult] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        setupConstraints()
        setTableView()
        
        MediaAPIManager.shard.fetchTrendingTV{ data in
            self.data = data
        }
        
    }
}

extension TrendViewController {
    
    func configureHierarchy() {
        view.addSubview(tableView)
        
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 340
        tableView.separatorStyle = .none
        
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.id)

    }
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let url = "https://image.tmdb.org/t/p/original\(data[indexPath.row].backdropPath)"
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.id, for: indexPath) as! TrendTableViewCell
        
        cell.nameLabel.text = data[indexPath.row].title ?? data[indexPath.row].name
        cell.dateLabel.text = data[indexPath.row].releaseDate ?? data[indexPath.row].firstAirDate
        cell.overviewLabel.text = data[indexPath.row].overview
        cell.posterImageView.kf.setImage(with: URL(string: url))
        cell.voteAverageLabel.text = "\(data[indexPath.row].voteAverage)"
        
        return cell
    }
    
    
}
