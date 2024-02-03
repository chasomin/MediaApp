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
        
        let vc = TVDetailViewController()
        vc.modalPresentationStyle = .fullScreen
        
        MediaAPIManager.shard.fetchMedia(api: .search(query: searchText)) { result in
            self.data = result
            vc.fetchData(id: self.data.results.first?.id ?? 0){
                vc.navTitle = self.data.results.first?.name ?? ""
                self.present(vc, animated: true)
                searchBar.text = ""
            }
        }
        
    }
    
}
