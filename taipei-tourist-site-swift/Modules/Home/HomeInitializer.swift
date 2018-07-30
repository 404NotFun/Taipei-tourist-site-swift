//
//  HomeInitializer.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class HomeInitializer: NSObject {
    @IBOutlet weak var homeViewController: HomeViewController!
    
    override func awakeFromNib() {
        
        let configurator = HomeConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }
    
}
