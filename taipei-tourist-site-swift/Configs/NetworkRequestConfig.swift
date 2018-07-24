//
//  NetworkRequestConfig.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import NetworkRequestKit

extension NetworkRequest {
    public var baseURL: String { return "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5" }
    public var accessToken: String { return "" }
    public var headers: [String : String] { return ["access_token": accessToken] }
}
