//
//  HomeViewModel.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/30.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

final public class HomeViewModel {
    let listCount: Int
    let listTitle: String
    var list: [TouristSiteViewModel]
    
    required public init (listCount: Int, listTitle: String, list: [TouristSiteViewModel]) {
        self.listCount = listCount
        self.listTitle = listTitle
        self.list = list
    }
}
