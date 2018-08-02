//
//  HomeViewInpu.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import TMBase
/*****
 * Presenter --> View
 *****/
protocol HomeViewInput: class {
    func setupInitialState()
    func refreshViewModel(viewModel: HomeViewModel)
    func refreshDataResult(msg: String?)
    func loadMoreData(viewModels: [TouristSiteViewModel])
    func loadDataResult(msg: String?)
}
