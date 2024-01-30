//
//  MediaViewController.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

class MediaViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
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
        
        tableView.rowHeight = 350
        
        tableView.separatorStyle = .none
        
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "Media")
    }
    
    
}

extension MediaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Media", for: indexPath) as! MediaTableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: "MediaCollectionView")
        cell.collectionView.reloadData()

        
        return cell
    }
}

extension MediaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionView", for: indexPath) as! MediaCollectionViewCell
        
        return cell
    }
    
    
}
