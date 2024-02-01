//
//  MediaView.swift
//  MediaApp
//
//  Created by 차소민 on 2/1/24.
//

import UIKit 
import SnapKit


class MediaView: BaseView {
 
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
        tableView.rowHeight = 400
        
        tableView.separatorStyle = .none
        
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: MediaTableViewCell.id)
    }

    
}
