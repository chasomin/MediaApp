//
//  MediaViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

final class MediaViewController: BaseViewController {
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
    
    private func fetchData() {
        let group = DispatchGroup()
        
        group.enter()
//        MediaAPIManager.shard.fetchMedia(api: .trend) { result in
//            self.dataList[0] = result
//            group.leave()
//        }
        
        MediaSessionManager.shared.request(api: .trend, type: Media.self) { result, error in
            if error == nil {
                guard let result else { return }
                self.dataList[0] = result
                self.mainView.tableView.reloadData()
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")
            }
            group.leave()
        }
        
        group.enter()
//        MediaAPIManager.shard.fetchMedia(api: .topRated) { result in
//            self.dataList[1] = result
//            group.leave()
//        }
        MediaSessionManager.shared.request(api: .topRated, type: Media.self) { result, error in
            if error == nil {
                guard let result else { return }
                self.dataList[1] = result
                self.mainView.tableView.reloadData()
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")

            }
            group.leave()
        }
        
        
        group.enter()
//        MediaAPIManager.shard.fetchMedia(api: .popular) { result in
//            self.dataList[2] = result
//            group.leave()
//        }
        MediaSessionManager.shared.request(api: .popular, type: Media.self) { result, error in
            if error == nil {
                guard let result else { return }
                self.dataList[2] = result
                self.mainView.tableView.reloadData()
            } else {
                self.showToast(text: "오류가 발생했습니다.\n잠시후에 다시 시도해주세요")
            }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TVDetailViewController()
        
        vc.navTitle = dataList[collectionView.tag].results[indexPath.item].name
        
        vc.modalPresentationStyle = .fullScreen

        vc.fetchData(id: dataList[collectionView.tag].results[indexPath.item].id) {
            self.present(vc, animated: true)
        }

    }
    
}

extension MediaViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if let cv = scrollView as? UICollectionView {
            let layout = cv.collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidth = layout.itemSize.width + layout.minimumLineSpacing
            
            var offset = targetContentOffset.pointee
            var index = round((offset.x + cv.contentInset.left) / cellWidth)
            
            if cv.contentOffset.x > targetContentOffset.pointee.x {
                index = floor(index)
            } else {
                index = ceil(index)
            }
            
            offset = CGPoint(x: index * cellWidth, y: -cv.contentInset.top)
            targetContentOffset.pointee = offset
            
        }
    }
}
