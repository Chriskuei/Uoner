//
//  UCAS.swift
//  Uoner
//
//  Created by Chris on 2019/5/16.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import Foundation

class UCAS {
    
    struct URL {
        static let BaseURL = "http://210.77.16.21/eportal/InterFace.do"
        static let LoginURL = "http://210.77.16.21/eportal/InterFace.do?method=login"
        static let InfoURL = "http://210.77.16.21/eportal/InterFace.do?method=getOnlineUserInfo"
        static let RedirectorURL = "http://210.77.16.21/eportal/redirectortosuccess.jsp"
        static let RemovedURL = "http://210.77.16.21/eportal/index.jsp?"
        static let LogoutURL = "http://210.77.16.21/eportal/InterFace.do?method=logout"
    }
}
