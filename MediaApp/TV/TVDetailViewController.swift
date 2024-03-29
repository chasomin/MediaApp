//
//  TVDetailViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit

enum TVData {
    static var detail = Result(id: 0, backdrop: "", poster: "", firstAirDate: "", name: "", originalName: "", overview: "", voteAverage: 0, episodeRunTime: [], genres: [], lastEpisodeToAir: Episode(airDate: ""), nextEpisodeToAir: Episode(airDate: ""), networks: [])
    static var cast = AggregateCredits(cast: [])
    static var recommand =  Media(results: [])
    
    static let all: [Any] = [TVData.detail, TVData.cast, TVData.recommand]
    
    
    static let detailType = Result.self
    static let caseType = AggregateCredits.self
    static let recommandType = Media.self

    
}


final class TVDetailViewController: BaseViewController {
    var navTitle = ""
    
    let mainView = TVDetailView()

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = navTitle
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self        

    }
}

extension TVDetailViewController {
    @objc func dismissView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            if sender.velocity(in: mainView).y > 0 {
                
                dismiss(animated: true)
            }
        default:
            break
        }
        
    }
    @objc func dismissButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func videoButtonTapped() {
        MediaSessionManager.shared.request(api: .video(id: TVData.detail.id), type: Video.self) { result, error in
            if error == nil {
                guard let result else { return }
                if !result.results.isEmpty {
                    let vc = VideoWebViewController()
                    vc.videoKey = result.results.first?.key ?? ""
                    self.present(vc, animated: true)
                } else {
                    self.showToast(text: "비디오가 제공되지 않습니다")
                }
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")
            }
        }
    }

    func fetchData(id: Int, completionHandler: @escaping (() -> Void)) {
        let group = DispatchGroup()
        
        group.enter()
        
        MediaSessionManager.shared.request(api: .detail(id: id), type: TVData.detailType) { result, error in
            if error == nil {
                guard let result else { return }
                TVData.detail = result
                group.leave()
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")
            }
        }

        group.enter()
        MediaSessionManager.shared.request(api: .cast(id: id), type: TVData.caseType) { result, error in
            if error == nil {
                guard let result else { return }
                TVData.cast = result
                group.leave()
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")
            }
        }

        group.enter()
        MediaSessionManager.shared.request(api: .recommand(id: id), type: TVData.recommandType) { result, error in
            if error == nil {
                guard let result else { return }
                TVData.recommand = result
                group.leave()
            } else {
                self.showToast(text: "오류가 발생했습니다\n잠시후에 다시 시도해주세요")
            }
        }

        group.notify(queue: .main) {
            self.mainView.tableView.reloadData()
            completionHandler()
        }

    }
}

extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TVData.recommand.results.isEmpty {
            TVData.all.count - 1

        } else {
            TVData.all.count
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TVDetailTableViewCell.id, for: indexPath) as! TVDetailTableViewCell
            
            cell.configureCell(data: TVData.detail)
            cell.gesture.addTarget(self, action: #selector(dismissView))
            cell.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
            cell.videoButton.addTarget(self, action: #selector(videoButtonTapped), for: .touchUpInside)
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TVCastTableViewCell.id, for: indexPath) as! TVCastTableViewCell
            cell.collectionView.tag = indexPath.row
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            cell.collectionView.register(TVCastCollectionViewCell.self, forCellWithReuseIdentifier: TVCastCollectionViewCell.id)
            
            cell.collectionView.reloadData()
            cell.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: false)

            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MediaTableViewCell.id, for: indexPath) as! MediaTableViewCell
            
            cell.label.text = "비슷한 콘텐츠"
        
            cell.collectionView.tag = indexPath.row

            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.id)
            cell.collectionView.reloadData()
            cell.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: false)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            UITableView.automaticDimension 
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = TVData.recommand.results[indexPath.item].id
        
        if collectionView.tag == 2 {
            fetchData(id: id) {
                self.mainView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }
            
        }

    }
    
}


extension TVDetailViewController: UIScrollViewDelegate {
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
