//
//  FrontPageBuilder.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

public protocol FrontPageBuilder {
    func buildFrontPageModule() -> UIViewController?
}

public struct FrontPageDefaultBuilder : FrontPageBuilder {
    
    public func buildFrontPageModule() -> UIViewController? {
        let view = FrontPageViewController()
        
//        let countDown = DefaultOpenLotteryCountDownService()
//        let invoiceAwardsStore = DefaultInvoiceAwardsStoreService()
//        let interactor = MeowFrontPageDefaultInteractor(countDownService: countDown, invoiceAwardsStore: invoiceAwardsStore)
//        let router = MeowFrontPageDefaultRouter(viewController: view)
//        let presenter = MeowFrontPageDefaultPresenter(interactor: interactor,
//                                                      router: router,
//                                                      view: view)
//
//        view.presenter = presenter
        
        return view
    }
    
}
