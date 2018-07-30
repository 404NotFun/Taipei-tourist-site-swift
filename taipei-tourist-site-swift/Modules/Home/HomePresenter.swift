//
//  HomePresenter.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import RxSwift
import TMBase
import RxDataSources

class HomePresenter {
    // V、I、R
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
    // data
    var siteResultObservable: Observable<TouristSiteResult>!
    
    // disposebag
    let disposebag = DisposeBag()
}


extension HomePresenter: HomeViewOutput {
    func viewIsReady() {
        reloadData()
    }
    
    func reloadData() {
        interactor.provideTouristSiteResult(page: 1)
    }
}

extension HomePresenter: HomeInteractorOutput {
    func receiveTouristSiteResultData(observable: Observable<TouristSiteResult>) {
        self.siteResultObservable = observable
        siteResultObservable
            .subscribe(onNext: { result in
                let listVm: [TouristSiteViewModel] = (result.results.map({ TouristSiteViewModel(title: $0.stitle ?? "未知", content: $0.address ?? "未知")}))
                self.view.refreshViewModel(viewModel: HomeViewModel(listCount: listVm.count, listTitle: "台北熱點", list: listVm))
            }, onError: { error in
                self.view.loadDataSuccess()
                print("onError I found \(error)!")
            }, onCompleted: {
                self.view.loadDataSuccess()
                print("onCompleted")
            }, onDisposed: {
                
            }).addDisposableTo(disposebag)
    }
}
