//
//  SearchResultView.swift
//  MediaApp
//
//  Created by 차소민 on 2/3/24.
//

import UIKit
import SnapKit

final class SearchResultView: BaseView {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    
    private static func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - (spacing)*4) / 3 , height: 200)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: spacing, bottom: 0, right: spacing)
        layout.scrollDirection = .vertical
        
        return layout
    }

    override func configureHierarchy() {
        addSubview(collectionView)
    }

    override func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        
    }
}
