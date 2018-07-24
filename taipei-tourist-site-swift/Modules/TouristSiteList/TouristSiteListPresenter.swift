//
//  TouristSiteListPresenter.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public protocol TouristSiteListPresenter {
    func closeTouristSiteListView()
    func loadContent()
    var touristSiteListViewModel: TouristSiteListViewModel { get }
}

final public class TouristSiteListDefaultPresenter: TouristSiteListPresenter {
    public private(set) weak var view: TouristSiteListView?
    private var interactor: TouristSiteListInteractor
    private let router: TouristSiteListRouter
    
    public required init(interactor: TouristSiteListInteractor, router: TouristSiteListRouter, view: TouristSiteListView) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    public func closeTouristSiteListView() {
        router.navigateBack()
    }
    
    public func loadContent() {
        view?.presentInitContent()
    }
    
    public var touristSiteListViewModel: TouristSiteListViewModel {
        return interactor.touristSiteListViewModel
    }
}

fileprivate struct TouristSiteListViewModelBuilder {
    
//    func buildViewModel(countDownDays: Int, nextDate: Date) -> CountDownInformationViewModel {
//        return CountDownInformationViewModel(countDownDays: countDownDays, nextOpenLotteryDate: nextDate)
//    }
    
//    func bulidViewModel(_ invoiceAwards: (thisMonth: InvoiceAwards?, previousMonth: InvoiceAwards?)) -> FrontPageInvoiceAwardsViewModel {
//        return FrontPageInvoiceAwardsViewModel(thisMonth: invoiceAwards.thisMonth, previousMonth: invoiceAwards.previousMonth)
//    }
    
}
