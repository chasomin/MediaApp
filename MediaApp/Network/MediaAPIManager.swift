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
    
    let headers: HTTPHeaders = ["Authorization":APIKey.key]
    let BaseURL = "https://api.themoviedb.org/3/"
    
    func fetchTrendingTV(completionHandler: @escaping (Media)->()) {
        let url = BaseURL + "trending/tv/week?language=ko-KR"
        
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
        let url = BaseURL + "tv/top_rated?language=ko-KR"
        
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
        let url = BaseURL + "tv/popular?language=ko-KR"
        
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

    
    func fetchDetailsTV(id: Int, completionHandler: @escaping (Result) -> Void) {
        let url = BaseURL + "tv/\(id)?language=ko-KR"
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Result.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
    func fetchRecommandationTV(id: Int, completionHandler: @escaping (Media) -> Void) {
        let url = BaseURL + "tv/\(id)/recommendations?language=ko-KR"
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Media.self) { response in
                switch response.result {
                case .success(let success):
//                    dump(success)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }

    }
    
    func fetchAggregateCreditsTV(id: Int, completionHandler: @escaping (AggregateCredits) -> Void) {
        let url = BaseURL + "tv/\(id)/aggregate_credits"

        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: AggregateCredits.self) { response in
                switch response.result {
                case .success(let success):
//                    dump(success.cast)
                    completionHandler(success)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
    
}
