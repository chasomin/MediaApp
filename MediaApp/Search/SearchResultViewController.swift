//
//  SearchResultViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/3/24.
//

import UIKit

final class SearchResultViewController: UIViewController {
    
    let mainView = SearchResultView()
    
    var data = Media(results: [])
    var navigationTitle: String = ""
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationTitle
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.id)

    }
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.id, for: indexPath) as! SearchResultCollectionViewCell
        
        cell.configureCell(data: data.results[indexPath.item])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TVDetailViewController()
        vc.modalPresentationStyle = .fullScreen
        
        vc.fetchData(id: data.results[indexPath.item].id) {
            vc.navTitle = self.data.results[indexPath.item].name
            self.present(vc, animated: true)
            
        }
    }
}

