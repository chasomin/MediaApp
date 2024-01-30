//
//  TrendData.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation

struct Trend: Decodable {
    let page: Int
    let results: [TrendResult]
}

struct TrendResult: Decodable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String?
    let originalLanguage: String
    let originalTitle: String?
    let overview, posterPath: String
    let mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

