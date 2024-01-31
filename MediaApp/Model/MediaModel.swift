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
    let episodeRunTime: [Int]?
    let genres: [Genre]?
    let lastEpisodeToAir: Episode?
    let nextEpisodeToAir: Episode?
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
        case lastEpisodeToAir = "last_episode_to_air"
        case nextEpisodeToAir = "next_episode_to_air"
        case networks
    }
    
    var vote: String {
        return String(format: "%.2f", voteAverage)
    }
    
    var titleLabel: String {
        return "\(name) | \(originalName) "
    }
    
    var voteLable: String {
        return "\(vote) / 10.00"
    }
    
    var runtime: String {
        return "회차 당 \(episodeRunTime?.first ?? 0)분"
    }

    var genre: String {
        let genre = genres?.map {
            if $0.name != genres?.last?.name {
               return "\($0.name)∙"
            }
            return "\($0.name)"
        }
        let genreString = genre?.reduce("",+)
        return genreString ?? ""
    }
    
    var airData: String {
        if nextEpisodeToAir != nil {
            return "\(firstAirDate) ~"
        } else {
            return "\(firstAirDate) ~ \(String(describing: lastEpisodeToAir?.air_date))"
        }
    }
}

struct Genre: Decodable {
    let name: String
}

struct Network: Decodable {
    let logo_path: String
    let name: String
    
    var nameLabel: String {
        return "채널 \(name)"
    }
}



struct Episode: Decodable {
    let air_date: String
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
