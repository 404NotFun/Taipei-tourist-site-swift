//
//  HomeInteractor.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import TMBase

class HomeInteractor {
    weak var output: HomeInteractorOutput!
}

extension HomeInteractor: HomeInteractorInput {
    func provideTouristSiteResult(page: Int) {
        self.output.receiveTouristSiteResultData(observable: TouristSiteDataManager.getTouristSiteList(page: page, limit: 10))
    }
    
    func provideMoreTouristSite(page: Int) {
        self.output.receiveMoreTouristSite(observable: TouristSiteDataManager.getTouristSiteList(page: page, limit: 10))
    }
}
