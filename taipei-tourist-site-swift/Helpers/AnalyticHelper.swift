//
//  AnalyticHelper.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

final public class AnalyticsHelper {
    
    public class func instance() -> AnalyticsHelper {
        
        struct Static {
            static let instance: AnalyticsHelper = AnalyticsHelper()
        }
        
        return Static.instance
    }
    
    private init() { }
    
    public func test() { }
}
