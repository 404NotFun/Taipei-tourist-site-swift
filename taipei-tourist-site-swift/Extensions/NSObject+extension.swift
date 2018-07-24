//
//  NSObject+extension.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/25.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
    
}
