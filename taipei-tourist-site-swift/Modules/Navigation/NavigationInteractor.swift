//
//  NavigationInteractor.swift
//  Invoice
//
//  Created by David on 2017/6/15.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation

public protocol NavigationInteractor {
    func updateTouristSiteList()
    func retryUpdate()
}

final public class NavigationDefaultInteractor : NavigationInteractor {
  
    private let touristSiteListStore: TouristSiteListStoreService
    private let touristSiteListFetcher: FetchTouristSiteListService
  
    public init(touristSiteListStore: TouristSiteListStoreService, touristSiteListFetcher: FetchTouristSiteListService) {
        self.touristSiteListStore = touristSiteListStore
        self.touristSiteListFetcher = touristSiteListFetcher
        NotificationCenter.default.addObserver(self,
                                           selector: #selector(NavigationDefaultInteractor.updateTouristSiteList),
                                           name: NSNotification.Name.UIApplicationWillEnterForeground,
                                           object: nil)
    }
  
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
  
    @objc public func updateTouristSiteList() {
        FetchTouristSiteList().makeRequest(forPage: 1).done({ data -> Void in
            self.touristSiteListStore.updateTouristSiteList(with: data.results)
            NotificationCenter.default.post(name: AppNotification.TouristSiteListUpdateNotificatoin, object: nil)
        }).catch({ e in
            self.retryUpdate()
        })
    }
  
    public func retryUpdate() {
        _ = Queue.delayInMainQueue(for: 3.0).done({ () -> () in
            self.updateTouristSiteList()
        })
    }
  
}
