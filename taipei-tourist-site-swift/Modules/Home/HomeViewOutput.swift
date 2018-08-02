//
//  HomeViewOutput.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit
import TMBase

/*****
 * View --> Presenter
 *****/
protocol HomeViewOutput {
    func viewIsReady()
    func reloadData()
    func loadMoreData(page: Int?)
    func presentDetail(imageViewModel: ImageCvCellViewModel)
}
