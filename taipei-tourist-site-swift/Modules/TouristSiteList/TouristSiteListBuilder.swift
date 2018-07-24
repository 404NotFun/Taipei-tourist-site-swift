//
//  TouristSiteListBuilder.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

public protocol TouristSiteListBuilder {
    func buildTouristSiteListModule() -> UIViewController?
}

final public class TouristSiteListDefaultBuilder : TouristSiteListBuilder {
    
    public func buildTouristSiteListModule() -> UIViewController? {
        let view = TouristSiteListViewController()
        
//        let countDown = DefaultOpenLotteryCountDownService()
//        let invoiceAwardsStore = DefaultInvoiceAwardsStoreService()
        let interactor = TouristSiteListDefaultInteractor()
        let router = TouristSiteListDefaultRouter(viewController: view)
        let presenter = TouristSiteListDefaultPresenter(interactor: interactor,
                                                      router: router,
                                                      view: view)
        
        view.presenter = presenter
        
        return view
    }
    
}
