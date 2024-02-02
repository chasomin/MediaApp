//
//  SearchViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/2/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .black

    }
    
}
