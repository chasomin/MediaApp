//
//  Constans.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import UIKit

enum Constants {
    
    enum Mock {
        static let titleList = ["Trend", "Top Rated", "Popular"]
    }
    
    enum Image {
        
        enum ImageBaseURL {
            static let baseURL = "https://image.tmdb.org/t/p/w500"
        }
        
        enum PlaceholderImage {
            static let image = UIImage(systemName: "movieclapper")
        }
    }
}
