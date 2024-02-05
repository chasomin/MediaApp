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
    
//    func fetchMedia<T: Decodable>(api: MediaAPI, completionHandler: @escaping (T) -> Void) {
//        
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
    
    
//    func fetchTrendingTV(api: MediaAPI, completionHandler: @escaping (Media)->()) {
//        
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: Media.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
//    
//    func fetchTopRatedTV(api: MediaAPI, completionHandler: @escaping (Media)->()) {
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: Media.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
//    
//    
//    func fetchPopularTV(api: MediaAPI,completionHandler: @escaping (Media) -> Void) {
//        
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: Media.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
//
//    
//    func fetchDetailsTV(api: MediaAPI, completionHandler: @escaping (Result) -> Void) {
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: Result.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
//    
//    func fetchRecommandationTV(api: MediaAPI, completionHandler: @escaping (Media) -> Void) {
//        
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: Media.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//
//    }
//    
//    func fetchAggregateCreditsTV(api:MediaAPI, completionHandler: @escaping (AggregateCredits) -> Void) {
//
//        AF.request(api.endpoint,
//                   method: api.method,
//                   parameters: api.parameter,
//                   encoding: api.encoding,
//                   headers: api.header)
//            .responseDecodable(of: AggregateCredits.self) { response in
//                switch response.result {
//                case .success(let success):
//                    completionHandler(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
    
}
