//
//  Collection+extension.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/31.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

extension Collection {
    func splitAt(isSplit: (Iterator.Element) throws -> Bool) rethrows -> [SubSequence] {
        var p = self.startIndex
        var result:[SubSequence] = try self.indices.flatMap {
            i in
            guard try isSplit(self[i]) else {
                return nil
            }
            defer {
                p = self.index(after: i)
            }
            return self[p...i]
        }
        if p != self.endIndex {
            result.append(suffix(from: p))
        }
        return result
    }
}
