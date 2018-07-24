//
//  NavigationPresenter.swift
//  Invoice
//
//  Created by David on 2017/6/15.
//  Copyright © 2017年 david. All rights reserved.
//

import Foundation

public protocol NavigationPresenter {
  func loadContent()
  func presentMoreOptionView()
}

final public class NavigationDefaultPresenter : NavigationPresenter {
  private weak var view: NavigationView?
  private let router: NavigationRouter
  private let interactor: NavigationInteractor
  
  required public init(view: NavigationView, router: NavigationRouter, interactor: NavigationInteractor) {
    self.view = view
    self.router = router
    self.interactor = interactor
  }
  
  public func loadContent() {
    interactor.updateTouristSiteList()
  }
  
  public func presentMoreOptionView() {
    router.navigateToTouristSiteListView()
  }
  
}
