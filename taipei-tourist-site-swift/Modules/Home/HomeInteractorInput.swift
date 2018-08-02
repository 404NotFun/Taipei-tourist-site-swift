//
//  HomeInteractorInput.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
/*****
 * Presenter --> Interactor
 *****/
protocol HomeInteractorInput {
    func provideTouristSiteResult(page: Int)
    func provideMoreTouristSite(page: Int)
//    func provideBannerData(path: String)
//    func provideWikiData(department: Int, categoryId: String)
}
