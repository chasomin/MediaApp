//
//  MediaSessionManager.swift
//  MediaApp
//
//  Created by 차소민 on 2/5/24.
//

import Foundation

final class MediaSessionManager {
    static let shared = MediaSessionManager()
    private init() { }

    func request<T: Decodable>(api: MediaAPI, type: T.Type = T.self, completionHandler: @escaping (T?, Error?) -> Void) {
        var url = URLRequest(url: api.endpoint)
        
        // ???: URLComponents(url:) 로 받는거랑 URLComponents(string:)으로 받는거랑 차이
        // ???: resolvingAgainstBaseURL 값이 true, false 뭔 차이
        var components = URLComponents(url: api.endpoint, resolvingAgainstBaseURL: false)
//        var components = URLComponents(string: api.endpoint.absoluteString)
        components?.queryItems = api.query
        if let components {
            url.url = components.url
            url.httpMethod = "GET"
            url.addValue(APIKey.key, forHTTPHeaderField: "Authorization")
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(nil, error)
                    return
                }
                
                guard let data else {
                    completionHandler(nil, error)
                    
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil, error)
                    
                    return
                }
                
                guard response.statusCode == 200 else {
                    completionHandler(nil, error)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result, nil)
                    print(result)
                } catch {
                    completionHandler(nil, error)
                    print(error)
                }
            }
        }.resume()
    }
}


