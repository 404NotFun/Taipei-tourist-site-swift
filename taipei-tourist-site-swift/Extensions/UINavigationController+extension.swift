//
//  UINavigationController+extension.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/8/2.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

extension UINavigationController {
    public func asyncPush(_ viewControllerToPush: UIViewController?, animated: Bool, completion: (() -> Void)? = nil) {
        Queue.main {
            if let viewControllerToPush = viewControllerToPush {
                self.pushViewController(viewControllerToPush, animated: true)
            }
        }
    }
    
    public func asyncPop(_ animated: Bool, completion: (() -> Void)? = nil) {
        Queue.main {
            self.popViewController(animated: animated)
        }
    }
}
