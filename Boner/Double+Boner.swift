//
//  Double+Boner.swift
//  Boner
//
//  Created by Chris on 17/4/4.
//  Copyright © 2017年 Chris. All rights reserved.
//

import Foundation

extension Double {
    
    func byteToKilobyte() -> Double {
        return self / (1024)
    }

    func byteToMegabyte() -> Double {
        return self / (1024 * 1024)
    }
    
    func byteToGigabyte() -> Double {
        return self / (1024 * 1024 * 1024)
    }
    
    func gigabyteToByte() -> Double {
        return self * (1024 * 1024 * 1024)
    }
    
}
