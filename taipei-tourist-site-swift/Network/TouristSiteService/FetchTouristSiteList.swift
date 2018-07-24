//
//  FetchTouristSiteList.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import NetworkRequestKit
import SwiftyJSON
import Alamofire
import PromiseKit

public protocol FetchTouristSiteListService {
    func makeRequest(forPage page: Int) -> Promise<FetchTouristSiteResult>
}

final public class FetchTouristSiteList: NetworkRequest, FetchTouristSiteListService {
    
    public typealias ResponseType = FetchTouristSiteResult
    
    public var endpoint: String { return "" }
    public var method: HTTPMethod { return .get }
    public var parameters: [String : Any]? { return ["offset": page*limit, "limit": limit] }
    
    public var limit: Int = 10
    public var page: Int = 0
    
    public func makeRequest(forPage page: Int) -> Promise<FetchTouristSiteResult> {
        self.page = page - 1
        return networkClient.performRequest(self).then({ data -> Promise<FetchTouristSiteList.ResponseType> in
                let json = try JSON(data: data)["result"]
                return try self.responseHandler(try json.rawData())
            })
    }
}
