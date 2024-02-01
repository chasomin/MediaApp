//
//  TVDetailTableViewCell.swift
//  MediaApp
//
//  Created by 차소민 on 1/31/24.
//

import UIKit
import SnapKit

class TVCastTableViewCell: UITableViewCell {
    let label = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        configureHierarchy()
        configureLayout()
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        
        return layout
    }

}


extension TVCastTableViewCell: CodebaseUI {
    func configureHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
    }
    
    func configureLayout() {
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(22)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    func configureView() {
        
        selectionStyle = .none
        label.text = "출연"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        
        collectionView.backgroundColor = .clear

    }
    
    
}

