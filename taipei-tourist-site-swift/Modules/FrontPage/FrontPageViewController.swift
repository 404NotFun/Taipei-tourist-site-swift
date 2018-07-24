//
//  FrontPageViewController.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

final public class FrontPageViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.backgroundOrange
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public func rearrangeSubviews() {
//        checkInvoiceView
//            .move(leftMargin, pointsBottomToAndInside: view)
//            .centerX(to: view)
//        
//        circularCountdownView.center.y = (view.bounds.height - checkInvoiceView.bounds.height - leftMargin) / 2
//        meowFootPrintImageView
//            .move(0, pointsRightFrom: circularCountdownView)
//            .move(-50, pointBelow: circularCountdownView)
    }
}
