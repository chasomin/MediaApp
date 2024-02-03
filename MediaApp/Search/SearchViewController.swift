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

        mainView.searchBar.delegate = self
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        let vc = SearchResultViewController()
        
        MediaAPIManager.shard.fetchMedia(api: .search(query: searchText)) { result in
            vc.data = result
            
            self.navigationController?.pushViewController(vc, animated: true)
            searchBar.text = ""
        }
        
    }
    
}
