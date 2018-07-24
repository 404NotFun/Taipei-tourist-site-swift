//
//  TouristSiteListInteractor.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public protocol TouristSiteListInteractor {
    var touristSiteListViewModel: TouristSiteListViewModel { get set }
    func getVm() -> TouristSiteListViewModel
}

final public class TouristSiteListDefaultInteractor : TouristSiteListInteractor {
    
    public var touristSiteListViewModel: TouristSiteListViewModel = TouristSiteListViewModel(listCount: 0, listTitle: "台北景點列表", list: [])
    
    required public init() {
        test()
    }
    
    deinit {

    }
    
    private func test() {
        FetchTouristSiteList().makeRequest(forPage: 1).done({ data in
            let vm: [TouristSiteViewModel] = data.results.map({ TouristSiteViewModel(title: $0.stitle) })
            self.touristSiteListViewModel = TouristSiteListViewModel(listCount: vm.count, listTitle: "台北景點列表", list: vm)
        }).catch({ e in
            print(e)
        })
    }
    
    public func getVm() -> TouristSiteListViewModel {
        return touristSiteListViewModel
    }
    
}
