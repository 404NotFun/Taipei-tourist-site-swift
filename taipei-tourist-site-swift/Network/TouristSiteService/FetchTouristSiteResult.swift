//
//  TouristSiteOpenData.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public struct FetchTouristSiteResult: Codable {
    public let offset: Int
    public let limit: Int
    public let count: Int
    public let sort: String
    public let results: [TouristSite]
}

//extension TouristSiteOpenData: Decodable {
//    enum CodingKeys : String, CodingKey {
//        case offset
//        case limit
//        case count
//        case sort
//        case results
//    }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        offset = try values.decode(Int.self, forKey: .offset)
//        limit = try values.decode(Int.self, forKey: .limit)
//        count = try values.decode(Int.self, forKey: .count)
//        sort = try values.decode(String.self, forKey: .sort)
//        results = try values.decode(String.self, forKey: .results)
//    }
//}

