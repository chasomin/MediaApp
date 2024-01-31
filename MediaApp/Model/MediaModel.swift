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
    let episodeRunTime: String?
    let genres: [Genre]?
    let next_episode_to_air: String?
    let networks: [Network]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case backdrop = "backdrop_path"
        case poster = "poster_path"
        case firstAirDate = "first_air_date"
        case originalName = "original_name"
        case voteAverage = "vote_average"
        case episodeRunTime = "episode_run_time"
        case genres
        case next_episode_to_air = "next_episode_to_air"
        case networks
    }
    
    var vote: String {
        return String(format: "%.2f", voteAverage)
    }
}

struct Genre: Decodable {
    let name: String
}

struct Network: Decodable {
    let logo_path: String
    let name: String
}


struct AggregateCredits: Decodable  {
    let cast: [Cast]
}
struct Cast: Decodable  {
    let name: String
    let profile_path: String?
    let roles: [Role]
}

struct Role: Decodable  {
    let character: String
}
