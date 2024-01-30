//
//  TVTopRatedModel.swift
//  MediaApp
//
//  Created by 차소민 on 1/30/24.
//

import Foundation
 

struct Media: Decodable {
//    let page: Int
    let results: [Result]
}

struct Result: Decodable {
    let id: Int
    let backdrop: String?
    let poster: String?
    let firstAirDate: String
    let name: String
    let originalName: String
    let overview: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case voteAverage = "vote_average"
    }
    
    var vote: String {
        return String(format: "%.2f", voteAverage)
    }
}
