//
//  TrendAPIManager.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation
import Alamofire

struct MediaAPIManager {
    static let shard = MediaAPIManager()
    
    private init() {}
    
    func fetchTrendingTV(completionHandler: @escaping (Media)->()) {
        let url = "https://api.themoviedb.org/3/trending/tv/week?language=ko-KR"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Media.self) { response in
                switch response.result {
                case .success(let success):
//                    dump(success.results)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    func fetchTopRatedTV(completionHandler: @escaping (Media)->()) {
        let url = "https://api.themoviedb.org/3/tv/top_rated?language=ko-KR"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Media.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success.results)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    
    func fetchPopularTV(completionHandler: @escaping (Media) -> Void) {
        let url = "https://api.themoviedb.org/3/tv/popular?language=ko-KR"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Media.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success.results)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }

    
}
