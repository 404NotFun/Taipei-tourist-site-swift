//
//  NavigationRouter.swift
//  Invoice
//
//  Created by David on 2017/6/15.
//  Copyright © 2017年 david. All rights reserved.
//

import UIKit

public protocol NavigationRouter {
  func navigateToTouristSiteListView()
}

final public class NavigationDefaultRouter : NavigationRouter {
  
  public weak var viewController: UIViewController?
  private let transitionManager = NavigationTransitioningDelegate()
  
  required public init(viewController: UIViewController) {
    self.viewController = viewController
  }
  
  public func navigateToTouristSiteListView() {
//    AnalyticsHelper.instance().logShowSettingsPageEvent()
    let module = TouristSiteListDefaultBuilder().buildTouristSiteListModule()
    transitionManager.presentingViewController = module
    viewController?.asyncPresent(module, animated: true)
  }
  
}
