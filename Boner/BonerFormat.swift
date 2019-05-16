//
//  BonerFormat.swift
//  Boner
//
//  Created by Chris on 17/4/4.
//  Copyright © 2017年 Chris. All rights reserved.
//

import Foundation

class BonerFormat {
    
    class func formatData(_ byte: Double) -> String {
        let gigabyte = String(format: "%.2f", byte.byteToGigabyte())
        return gigabyte
    }
    
    class func formatOnlineInfo() -> String {
        
        let usedData: Double = 10
        let usedDataInfo = BonerFormat.formatData(usedData)
        
        let balance: Double = 10
        let balanceInfo = String(format: "%.0f", balance)
        
        let data = usedDataInfo + "/" + balanceInfo
        
        return data
    }
    
}
