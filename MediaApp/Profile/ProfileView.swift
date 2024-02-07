//
//  ProfileView.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit
import SnapKit

class ProfileView: BaseView {
    
    let profileImageView = CircleImageView(frame: .zero)
    let tableView = UITableView()
    let tapGesture = UITapGestureRecognizer()
    
    override func configureHierarchy() {
        addSubview(profileImageView)
        addSubview(tableView)
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    override func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(20)
            make.width.height.equalTo(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        profileImageView.kf.setImage(with: URL(string: "https://avatars.githubusercontent.com/u/114223423?v=4"))
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 50
    }
}
