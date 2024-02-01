//
//  TVDetailView.swift
//  MediaApp
//
//  Created by 차소민 on 2/1/24.
//

import UIKit
import SnapKit

class TVDetailView: BaseView {
    let tableView = UITableView()

    override func configureHierarchy() {
        addSubview(tableView)
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }

    override func configureView() {
        tableView.backgroundColor = .clear
        
        tableView.separatorStyle = .none

        tableView.register(TVDetailTableViewCell.self, forCellReuseIdentifier: TVDetailTableViewCell.id)
        tableView.register(TVCastTableViewCell.self, forCellReuseIdentifier: TVCastTableViewCell.id)
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: MediaTableViewCell.id)
    }

}
