//
//  MediaAPI.swift
//  MediaApp
//
//  Created by 차소민 on 2/1/24.
//

import Foundation
import Alamofire

enum MediaAPI {
    case trend
    case topRated
    case popular
    case detail(id: Int)
    case recommand(id: Int)
    case cast(id: Int)
    case search(query: String)
    case video(id: Int)
    
    var baseURL: String {
        "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        case .trend:
            URL(string: baseURL + "trending/tv/week")!
        case .topRated:
            URL(string: baseURL + "tv/top_rated")!
        case .popular:
            URL(string: baseURL + "tv/popular")!
        case .detail(let id):
            URL(string: baseURL + "tv/\(id)")!
        case .recommand(let id):
            URL(string: baseURL + "tv/\(id)/recommendations")!
        case .cast(let id):
            URL(string: baseURL + "tv/\(id)/aggregate_credits")!
        case .search:
            URL(string: baseURL + "search/tv")!
        case .video(let id):
            URL(string: baseURL + "tv/\(id)/videos")!
        }
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var parameter: Parameters {
        switch self {
        case .trend, .topRated, .popular, .detail, .recommand:
            ["language":"ko-KR"]
        case .cast, .video:
            ["":""]
        case .search(let query):
            ["language":"ko-KR", "query":query]
        }
    }
    
    var query: [URLQueryItem] {
        switch self {
        case .trend, .topRated, .popular, .detail, .recommand :
            [
                URLQueryItem(name: "language", value: "ko-KR")
            ]
        case .cast, .video:
            [
                URLQueryItem(name: "", value: "")
            ]

        case .search(let query):
            [
                URLQueryItem(name: "language", value: "ko-KR"),
                URLQueryItem(name: "query", value: query)
            ]
        }
    }
    
    var encoding: ParameterEncoding {
        URLEncoding(destination: .queryString)
    }
    
    var header: HTTPHeaders {
        ["Authorization":APIKey.key]
    }
}


