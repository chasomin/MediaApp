//
//  UserDefaultsManager.swift
//  MediaApp
//
//  Created by 차소민 on 2/5/24.
//

import Foundation

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    enum UDKey: String {
        case search
    }
    
    let ud = UserDefaults.standard
    
    var search: [String] {
        get {
            ud.stringArray(forKey: UDKey.search.rawValue) ?? []
        }
        set {
            ud.setValue(newValue, forKey: UDKey.search.rawValue)
        }
    }
    
    
}
