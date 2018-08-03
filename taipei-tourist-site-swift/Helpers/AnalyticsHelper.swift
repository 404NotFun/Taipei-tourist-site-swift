//
//  AnylyticsHelper.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/8/2.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public class AnalyticsHelper {
    public static let shared = AnalyticsHelper()
    private init() {
        
    }
    public func enterHomeScreen() {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "景點列表")
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    public func enterTouristSiteDetailScreen() {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        tracker.set(kGAIScreenName, value: "觀看景點照片")
        
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    public func scroll2LoadMore() {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        guard let builder = GAIDictionaryBuilder.createEvent(withCategory: "Action", action: "Scroll2LoadMore", label: nil, value: nil) else { return }
        tracker.send(builder.build() as [NSObject: AnyObject])
    }
    
    public func scroll2Refresh() {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        guard let builder = GAIDictionaryBuilder.createEvent(withCategory: "Action", action: "Scroll2Refresh", label: nil, value: nil) else { return }
        tracker.send(builder.build() as [NSObject: AnyObject])
    }
    
    public func expand2ReadMore() {
        guard let tracker = GAI.sharedInstance().defaultTracker else { return }
        guard let builder = GAIDictionaryBuilder.createEvent(withCategory: "Action", action: "Expand2ReadMore", label: nil, value: nil) else { return }
        tracker.send(builder.build() as [NSObject: AnyObject])
    }
}
