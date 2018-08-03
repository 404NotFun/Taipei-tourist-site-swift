//
//  HomeInteractorOutput.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import RxSwift
import TMBase
/*****
 * Interactor ---> Presenter
 *****/
protocol HomeInteractorOutput: class {
    func receiveTouristSiteResultData(observable: Observable<TouristSiteResult>)
    func receiveMoreTouristSite(observable: Observable<TouristSiteResult>)
//    var homeViewModel: HomeViewModel { get set }
}
