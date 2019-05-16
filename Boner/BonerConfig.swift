//
//  BonerConfig.swift
//  Boner
//
//  Created by Chris on 17/4/4.
//  Copyright © 2017年 Chris. All rights reserved.
//

import UIKit
import Foundation

public enum LoginState: String, CustomStringConvertible {
    case online = "online"
    case offline = "offline"
    
    public var description: String {
        return self.rawValue
    }
}

class BonerConfig {
    
    static let appGroupID: String = "group.bonerSharedDefaults"
    static let BonerFont: String = "AvenirNext-Regular"
    static let BaseURL = "http://210.77.16.21/eportal/InterFace.do"
    static let LoginURL = "http://210.77.16.21/eportal/InterFace.do?method=login"
    static let InfoURL = "http://210.77.16.21/eportal/InterFace.do?method=getOnlineUserInfo"
    static let RedirectorURL = "http://210.77.16.21/eportal/redirectortosuccess.jsp"
    static let RemovedURL = "http://210.77.16.21/eportal/index.jsp?"
    static let LogoutURL = "http://210.77.16.21/eportal/InterFace.do?method=logout"
    
    static let ScreenWidth: CGFloat = UIScreen.main.bounds.width
    static let ScreenHeight: CGFloat = UIScreen.main.bounds.height
    
}
