//
//  SearchViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let mainView = SearchView()
    
    var data = Media(results: [])
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = mainView.searchBar
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal

        mainView.searchBar.delegate = self
        
        mainView.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.id)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.separatorStyle = .none
        
        mainView.deleteAllButton.addTarget(self, action: #selector(deleteAllButtonTapped), for: .touchUpInside)
        
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchHistoryCheck()
    }
    
    func searchHistoryCheck() {
        if UserDefaultsManager.shared.search.isEmpty {
            mainView.tableView.isHidden = true
            mainView.recentView.isHidden = true
        } else {
            mainView.tableView.isHidden = false
            mainView.recentView.isHidden = false
        }
    }
    
    
    @objc func deleteAllButtonTapped() {
        UserDefaultsManager.shared.search.removeAll()
        mainView.tableView.isHidden = true
        mainView.recentView.isHidden = true
        mainView.tableView.reloadData()
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        UserDefaultsManager.shared.search.remove(at: sender.tag)
        searchHistoryCheck()
        mainView.tableView.reloadData()
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        UserDefaultsManager.shared.search.insert(searchText, at: 0)
        
        let vc = SearchResultViewController()
        
        MediaSessionManager.shared.request(api: .search(query: searchText), type: Media.self) { result, error in
            if error == nil {
                guard let result else { return }
                
                vc.data = result
                
                self.navigationController?.pushViewController(vc, animated: true)
                searchBar.text = ""
            }
        }
        
        mainView.tableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaultsManager.shared.search.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.id, for: indexPath) as! SearchTableViewCell
        
        cell.deleteButton.tag = indexPath.row
        cell.label.text = UserDefaultsManager.shared.search[indexPath.row]
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SearchResultViewController()
        
        let searchText = UserDefaultsManager.shared.search[indexPath.row]
        
        MediaSessionManager.shared.request(api: .search(query: searchText), type: Media.self) { result, error in
            
            if error == nil {
                guard let result else { return }
                vc.data = result
                vc.navigationTitle = searchText
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
            }
        }
        
    }
    
}

