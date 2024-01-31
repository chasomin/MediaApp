//
//  TVDetailViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import Kingfisher
import SnapKit

class TVDetailViewController: BaseViewController {
    
    let tableView = UITableView()
    var data = Media(results: [])
    var cast = AggregateCredits(cast: [])

    override func viewDidLoad() {
        super.viewDidLoad()

        let group = DispatchGroup()
        group.enter()
        MediaAPIManager.shard.fetchAggregateCreditsTV(id: 30983) { result in
            self.cast = result
            group.leave()
        }
        
        
        group.enter()
        MediaAPIManager.shard.fetchRecommandationTV(id: 30983) { result in
            self.data = result
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
    }
    
    override func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    override func configureView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
//        tableView.rowHeight = 400
        
        tableView.separatorStyle = .none

        tableView.register(TVDetailTableViewCell.self, forCellReuseIdentifier: TVDetailTableViewCell.id)
        tableView.register(TVCastTableViewCell.self, forCellReuseIdentifier: TVCastTableViewCell.id)
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: MediaTableViewCell.id)
    }
}

extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailTableViewCell.id, for: indexPath) as! TVDetailTableViewCell
            
            return cell

            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TVCastTableViewCell.id, for: indexPath) as! TVCastTableViewCell
            cell.collectionView.tag = indexPath.row
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(TVCastCollectionViewCell.self, forCellWithReuseIdentifier: TVCastCollectionViewCell.id)
            cell.collectionView.reloadData()

            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.id, for: indexPath) as! MediaTableViewCell
            
            cell.label.text = "비슷한 콘텐츠"
        
            cell.collectionView.tag = indexPath.row

            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.id)

            
            cell.collectionView.reloadData()
            return cell
        }
    }
    
    
}


extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            cast.cast.count
        } else {
            data.results.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCastCollectionViewCell.id, for: indexPath) as! TVCastCollectionViewCell
            
            let url = Constants.Image.ImageBaseURL.baseURL + (cast.cast[indexPath.item].profile_path ?? "")
            
            cell.imageView.kf.setImage(with: URL(string: url))
            cell.nameLabel.text = cast.cast[indexPath.item].name
            cell.roleLabel.text = cast.cast[indexPath.item].roles.first?.character
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.id, for: indexPath) as! MediaCollectionViewCell
            
            let item = data.results
            
            let url = URL(string: Constants.Image.ImageBaseURL.baseURL + (item[indexPath.item].backdrop ?? item[indexPath.item].poster ?? ""))
            
            cell.posterImageView.kf.setImage(with: url, placeholder: Constants.Image.PlaceholderImage.image)
            cell.nameLabel.text = item[indexPath.item].name
            cell.overviewLabel.text = item[indexPath.item].overview
            cell.dateLabel.text = item[indexPath.item].firstAirDate
            cell.voteAverageLabel.text = String(item[indexPath.item].vote)
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            100
        } else if indexPath.row == 1{
            200
        } else {
            400
        }
    }
}
