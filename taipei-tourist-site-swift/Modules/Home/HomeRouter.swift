//
//  HomeRouter.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import TMBase

class HomeRouter: HomeRouterInput {
    public weak var viewController: UIViewController?
    
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func navigateToDetail(with imageCellViewModel: ImageCvCellViewModel) {
        let module = TouristSiteDetailViewController(imageCellViewModel: imageCellViewModel)
        viewController?.navigationController?.asyncPush(module, animated: true)
    }
}
