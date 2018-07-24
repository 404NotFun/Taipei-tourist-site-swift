//
//  Disctionary+extension.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge<S: Sequence>(contentsOf other: S) where S.Iterator.Element == (key: Key, value: Value) {
        for (key, value) in other {
            self[key] = value
        }
    }
    
    func merged<S: Sequence>(with other: S) -> [Key: Value] where S.Iterator.Element == (key: Key, value: Value) {
        var dic = self
        dic.merge(contentsOf: other)
        return dic
    }
}
