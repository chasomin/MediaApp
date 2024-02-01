//
//  MediaViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class MediaViewController: BaseViewController {
    let mainView = MediaView()
    
    var dataList = [
        Media(results: []),
        Media(results: []),
        Media(results: [])
    ]

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

extension MediaViewController {
    
    func fetchData() {
        let group = DispatchGroup()
        
        group.enter()
        MediaAPIManager.shard.fetchTrendingTV { result in
            self.dataList[0] = result
            group.leave()
        }
        
        group.enter()
        MediaAPIManager.shard.fetchTopRatedTV { result in
            self.dataList[1] = result
            group.leave()
        }
        
        group.enter()
        MediaAPIManager.shard.fetchPopularTV { result in
            self.dataList[2] = result
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.mainView.tableView.reloadData()
        }

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
        
        cell.configureCell(item: item, url: url, index: indexPath.item)

        return cell
    }
    
    
}
