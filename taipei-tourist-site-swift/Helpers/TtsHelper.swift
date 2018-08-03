//
//  TtsHelper.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/31.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

class TtsHelper {
    static func splitFile(_ file: String) -> [String] {
        var splited = file.components(separatedBy: "http://")
        if splited.count > 1 {
            splited.removeFirst()
            for i in 0 ..< splited.count {
                splited[i] = "http://" + splited[i]
            }
        }
        return splited
    }
}
