//
//  BonerUserDefaults.swift
//  Boner
//
//  Created by Chris on 17/4/4.
//  Copyright © 2017年 Chris. All rights reserved.
//

import Foundation

let loginStateKey = "loginState"

let usernameKey = "username"
let passwordKey = "password"
let queryStringKey = "queryString"
let isSavedKey = "isSaved"

class BonerUserDefaults {
    
    
    private func saveDefaults(username: String, password: String, isSaved: Bool) {
        
        let userDefault = UserDefaults(suiteName: BonerConfig.appGroupID)!
        userDefault.setValue(username, forKey: usernameKey)
        userDefault.setValue(password, forKey: passwordKey)
        userDefault.setValue(isSaved, forKey: isSavedKey)
        userDefault.synchronize()
        
        userDefault.synchronize()
    }
    
    private func clearDefaults() {
        let userDefault = UserDefaults(suiteName: BonerConfig.appGroupID)!
        userDefault.removeObject(forKey: usernameKey)
        userDefault.removeObject(forKey: passwordKey)
        
        userDefault.synchronize()
    }
    
    static let defaults = UserDefaults(suiteName: BonerConfig.appGroupID)!
    
    static var username: String = {
        let savedUsername = defaults.string(forKey: usernameKey)
        if let username = savedUsername {
            return username
        } else {
            return ""
        }
        }() {
        didSet {
            defaults.setValue(username, forKey: usernameKey)
            defaults.synchronize()
        }
    }
    
    static var password: String = {
        let savedPassword = defaults.string(forKey: passwordKey)
        if let password = savedPassword {
            return password
        } else {
            return ""
        }
        }() {
        didSet {
            defaults.setValue(password, forKey: passwordKey)
            defaults.synchronize()
        }
    }
    
    static var queryString: String = {
        let savedQueryString = defaults.string(forKey: queryStringKey)
        if let queryString = savedQueryString {
            return queryString
        } else {
            return ""
        }
        }() {
        didSet {
            defaults.setValue(queryString, forKey: queryStringKey)
            defaults.synchronize()
        }
    }
    
    static var isSaved: Bool = {
        let isSaved = defaults.bool(forKey: isSavedKey)
        return isSaved
        }() {
        didSet {
            defaults.set(isSaved, forKey: isSavedKey)
            defaults.synchronize()
        }
    }
    
}
