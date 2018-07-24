//
//  ViewController.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bar: MyNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bar = MyNavigationBar(width: view.bounds.width)
        bar.anchor(to: view)
        
        FetchTouristSiteList().makeRequest(forPage: 1).done({ data -> Void in
            print(data.results.count)
        }).catch({ e in
            print(e)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

