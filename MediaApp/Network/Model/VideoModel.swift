//
//  VideoModel.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import Foundation

struct Video: Decodable {
    let results: [VideoResult]
}

struct VideoResult: Decodable {
    let key: String
}
