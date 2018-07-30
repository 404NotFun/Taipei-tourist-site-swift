//
//  RefreshEnum.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/28.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public enum RefreshEnum: Int {
    case pushSuccess
    case pushFailure
    case pullSuccess
    case pullFailure
    case noMoreData
    case unknown
}
