//
//  NavigationBuilder.swift
//  Invoice
//
//  Created by David on 2017/6/15.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

public protocol NavigationBuilder {
  func buildNavigationModule() -> UIViewController?
}

final public class NavigationDefaultBuilder : NavigationBuilder {
  
  public func buildNavigationModule() -> UIViewController? {
    let navigation = NavigationController()
    
    let router = NavigationDefaultRouter(viewController: navigation)
    let touristSiteListStore = DefaultTouristSiteListStoreService()
    let fetcher = FetchTouristSiteList()
    
    let interactor = NavigationDefaultInteractor(touristSiteListStore: touristSiteListStore, touristSiteListFetcher: fetcher as! FetchTouristSiteListService)
    let presenter = NavigationDefaultPresenter(view: navigation,
                                                   router: router,
                                                   interactor: interactor)
    
    navigation.presenter = presenter
    
    return navigation
  }
  
}
