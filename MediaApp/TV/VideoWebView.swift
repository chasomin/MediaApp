//
//  VideoWebView.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit
import WebKit
import SnapKit

class VideoWebView: BaseView {
    let webView = WKWebView()

    
    override func configureHierarchy() {
        addSubview(webView)
    }
    
    override func configureLayout() {
        webView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
