//
//  HomeConfigurator.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class HomeConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: HomeViewController) {
        let presenter = HomePresenter()
        let router = HomeRouter(viewController: viewController)
        let interactor = HomeInteractor()
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        viewController.output = presenter
    }
}
