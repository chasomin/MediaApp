//
//  MediaViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

class MediaViewController: UIViewController {
    
    let tableView = UITableView()
        
    var dataList = [
        Media(results: []),
        Media(results: []),
        Media(results: [])
    ]{
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureView()
        
        MediaAPIManager.shard.fetchTrendingTV { result in
            self.dataList[0] = result
        }
        
        MediaAPIManager.shard.fetchTopRatedTV { result in
            self.dataList[1] = result
        }
        
        MediaAPIManager.shard.fetchPopularTV { result in
            self.dataList[2] = result
        }

    }
    
}

extension MediaViewController: CodebaseUI {
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 400
        
        tableView.separatorStyle = .none
        
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: MediaTableViewCell.id)
    }
    
    
}

extension MediaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.Mock.titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.id, for: indexPath) as! MediaTableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.id)
        cell.collectionView.reloadData()

        cell.collectionView.tag = indexPath.row
        
        cell.label.text = Constants.Mock.titleList[indexPath.row]

        return cell
    }
}

extension MediaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList[collectionView.tag].results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.id, for: indexPath) as! MediaCollectionViewCell
        let item = dataList[collectionView.tag].results
        
        let url = URL(string: Constants.Image.ImageBaseURL.baseURL + (item[indexPath.item].backdrop ?? item[indexPath.item].poster ?? ""))
        
        cell.posterImageView.kf.setImage(with: url, placeholder: Constants.Image.PlaceholderImage.image)
        cell.nameLabel.text = item[indexPath.item].name
        cell.overviewLabel.text = item[indexPath.item].overview
        cell.dateLabel.text = item[indexPath.item].firstAirDate
        cell.voteAverageLabel.text = String(item[indexPath.item].vote)
        
        return cell
    }
    
    
}
