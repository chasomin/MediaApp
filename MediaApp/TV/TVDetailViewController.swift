//
//  TVDetailViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import Kingfisher
import SnapKit

enum TVData {
    static var detail = Result(id: 0, backdrop: "", poster: "", firstAirDate: "", name: "", originalName: "", overview: "", voteAverage: 0, episodeRunTime: [], genres: [], lastEpisodeToAir: Episode(air_date: ""), nextEpisodeToAir: Episode(air_date: ""), networks: [])
    static var cast = AggregateCredits(cast: [])
    static var recommand =  Media(results: [])
    
    static let all: [Any] = [TVData.detail, TVData.cast, TVData.recommand]
}


class TVDetailViewController: BaseViewController {
    let mainView = TVDetailView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self

        fetchData()
    }
}

extension TVDetailViewController {
    func fetchData() {
        let group = DispatchGroup()
        
        group.enter()
        MediaAPIManager.shard.fetchDetailsTV(id: 30983) { result in
            
            TVData.detail = result
            group.leave()
        }
        
        group.enter()
        MediaAPIManager.shard.fetchAggregateCreditsTV(id: 30983) { result in
            TVData.cast = result
            group.leave()
        }
        
        group.enter()
        MediaAPIManager.shard.fetchRecommandationTV(id: 30983) { result in
            TVData.recommand = result
            group.leave()
        }

        group.notify(queue: .main) {
            self.mainView.tableView.reloadData()
        }

    }
}

extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TVData.all.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailTableViewCell.id, for: indexPath) as! TVDetailTableViewCell
            
            cell.configureCell(data: TVData.detail)
            
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            250
        } else if indexPath.row == 1{
            250
        } else {
            400
        }
    }

    
}


extension TVDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            TVData.cast.cast.count
        } else {
            TVData.recommand.results.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCastCollectionViewCell.id, for: indexPath) as! TVCastCollectionViewCell
            
            cell.configureCell(data: TVData.cast, index: indexPath.row)
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.id, for: indexPath) as! MediaCollectionViewCell
            let item = TVData.recommand.results
            let url = URL(string: Constants.Image.ImageBaseURL.baseURL + (item[indexPath.item].backdrop ?? item[indexPath.item].poster ?? ""))
            
            cell.configureCell(item: item, url: url, index: indexPath.item)

            return cell
        }
        
        
    }
    
}
