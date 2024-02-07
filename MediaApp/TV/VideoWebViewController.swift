//
//  VideoWebViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit

//TODO: 빈 값이 들어올때 처리, 유튜브 넘겨줄 때 로딩뷰??
class VideoWebViewController: UIViewController {
    
    let mainView = VideoWebView()
    var videoKey = ""
    
    lazy var url = "https://www.youtube.com/watch?v=\(videoKey)"
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setWebView()
    }
    
    func setWebView() {
        if let url = URL(string: url) {
            let url = URLRequest(url: url)
            mainView.webView.load(url)
        }
        
    }

}
