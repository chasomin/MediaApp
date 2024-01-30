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
    
    func fetchTrendingTV(completionHandler: @escaping ([TrendResult])->()) {
        let url = "https://api.themoviedb.org/3/trending/tv/week"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Trend.self) { response in
                switch response.result {
                case .success(let success):
//                    dump(success.results)
                    completionHandler(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    func fetchTopRatedTV(completionHandler: @escaping ([TopRatedResult])->()) {
        let url = "https://api.themoviedb.org/3/tv/top_rated?language=ko-KR"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: TopRated.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success.results)
                    completionHandler(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    
//https://api.themoviedb.org/3/tv/popular
    
    
}
