//
//  TrendAPIManager.swift
//  MediaApp
//
//  Created by 차소민 on 1/17/24.
//

import Foundation
import Alamofire

struct TrendAPIManager {
    func callRequest(completionHandler: @escaping ([Result])->()) {
        let url = "https://api.themoviedb.org/3/trending/all/week"
        let headers: HTTPHeaders = ["Authorization":APIKey.key]
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: Trend.self) { response in
                switch response.result {
                case .success(let success):
                    dump(success.results)
                    completionHandler(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }
        
    }
}
