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
    
    func loadMoreData(page: Int?) {
        interactor.provideMoreTouristSite(page: page ?? 1)
    }
    
    func presentDetail(imageViewModel: ImageCvCellViewModel) {
        router.navigateToDetail(with: imageViewModel)
    }
}

extension HomePresenter: HomeInteractorOutput {
    func receiveMoreTouristSite(observable: Observable<TouristSiteResult>) {
        self.siteResultObservable = observable
        siteResultObservable
            .subscribe(onNext: { result in
                let listVm: [TouristSiteViewModel] = result.results.enumerated().map({(i,e) in
                    return TouristSiteViewModel(title: e.stitle ?? "未知", content: e.xbody ?? "未知", imageUrls: e.file ?? "", row: i, collapse:  true)
                })
                self.view.loadMoreData(viewModels: listVm)
            }, onError: { error in
                self.view.loadDataResult(msg: error.localizedDescription)
            }, onCompleted: {
                self.view.loadDataResult(msg: nil)
            }, onDisposed: {
                
            }).addDisposableTo(disposebag)
    }
    
    func receiveTouristSiteResultData(observable: Observable<TouristSiteResult>) {
        self.siteResultObservable = observable
        siteResultObservable
            .subscribe(onNext: { result in
                let listVm: [TouristSiteViewModel] = result.results.enumerated().map({(i,e) in
                    return TouristSiteViewModel(title: e.stitle ?? "未知", content: e.xbody ?? "未知", imageUrls: e.file ?? "", row: i, collapse: true)
                })
                self.view.refreshViewModel(viewModel: HomeViewModel(listCount: listVm.count, listTitle: "台北熱點", list: listVm))
            }, onError: { error in
                self.view.refreshDataResult(msg: error.localizedDescription)
            }, onCompleted: {
                self.view.refreshDataResult(msg: nil)
            }, onDisposed: {
                
            }).addDisposableTo(disposebag)
    }
}
