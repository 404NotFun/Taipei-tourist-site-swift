//
//  AnalyticConfig.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/8/3.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

extension AppDelegate {
    func analyticConfig() {
        guard let gai = GAI.sharedInstance() else {
            assert(false, "Google Analytics not configured correctly")
        }
        gai.tracker(withTrackingId: "UA-123356227-1")
        gai.trackUncaughtExceptions = true
        gai.logger.logLevel = .verbose;
    }
}
