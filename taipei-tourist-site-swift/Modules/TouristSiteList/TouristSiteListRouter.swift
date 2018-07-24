//
//  TouristSiteListRouter.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

public protocol TouristSiteListRouter {
    func navigateBack()
    func navigateToPreviewTouristSite(with selectedTouristSite: TouristSite)
}

final public class TouristSiteListDefaultRouter: TouristSiteListRouter {
    public weak var viewController: UIViewController?
    private let transitionManager = NavigationTransitioningDelegate()
    
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func navigateBack() {
        viewController?.asyncDismiss(true)
    }
    
    public func navigateToPreviewTouristSite(with selectedTouristSite: TouristSite) {
//        AnalyticsHelper.instance().logClickToEnterPreviewPageEvent()
//        let module = PreviewInvoiceViewController(invoiceAwards: invoiceAwards, selectedAwards: selectedInvoiceAwards)
//        transitionManager.presentingViewController = module
//        viewController?.asyncPresent(module, animated: true)
    }
}
