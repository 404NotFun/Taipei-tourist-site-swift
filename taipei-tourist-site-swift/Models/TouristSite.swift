//
//  TouristSiteRaw.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/24.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import SwiftyJSON
import NetworkRequestKit

public struct TouristSite: Codable {
    let _id: String
    let rowNumber: String
    let rEF_WP: String
    let cAT1: String
    let cAT2: String
    let sERIAL_NO: String
    let mEMO_TIME: String
    let stitle: String
    let xbody: String
    let avBegin: String
    let avEnd: String
    let idpt: String
    let address: String
    let xpostDate: String
    let file: String
    let langinfo: String
    let pOI: String
    let info: String
    let longitude: String
    let latitude: String
    let mRT: String
    
    enum JSONKeys: String, CodingKey {
        case results
    }
    
    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case rowNumber = "RowNumber"
        case rEF_WP = "REF_WP"
        case cAT1 = "CAT1"
        case cAT2 = "CAT2"
        case sERIAL_NO = "SERIAL_NO"
        case mEMO_TIME = "MEMO_TIME"
        case stitle = "stitle"
        case xbody = "xbody"
        case avBegin = "avBegin"
        case avEnd = "avEnd"
        case idpt = "idpt"
        case address = "address"
        case xpostDate = "xpostDate"
        case file = "file"
        case langinfo = "langinfo"
        case pOI = "POI"
        case info = "info"
        case longitude = "longitude"
        case latitude = "latitude"
        case mRT = "MRT"
    }
}

//extension TouristSiteRaw : Decodable {
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        _id = try values.decode(String.self, forKey: ._id)
//        rowNumber = try values.decode(String.self, forKey: .rowNumber)
//        rEF_WP = try values.decode(String.self, forKey: .rEF_WP)
//        cAT1 = try values.decode(String.self, forKey: .cAT1)
//        cAT2 = try values.decode(String.self, forKey: .cAT2)
//        sERIAL_NO = try values.decode(String.self, forKey: .sERIAL_NO)
//        mEMO_TIME = try values.decode(String.self, forKey: .mEMO_TIME)
//        stitle = try values.decode(String.self, forKey: .stitle)
//        xbody = try values.decode(String.self, forKey: .xbody)
//        avBegin = try values.decode(String.self, forKey: .avBegin)
//        avEnd = try values.decode(String.self, forKey: .avEnd)
//        idpt = try values.decode(String.self, forKey: .idpt)
//        address = try values.decode(String.self, forKey: .address)
//        xpostDate = try values.decode(String.self, forKey: .xpostDate)
//        file = try values.decode(String.self, forKey: .file)
//        langinfo = try values.decode(String.self, forKey: .langinfo)
//        pOI = try values.decode(String.self, forKey: .pOI)
//        info = try values.decode(String.self, forKey: .info)
//        longitude = try values.decode(String.self, forKey: .longitude)
//        latitude = try values.decode(String.self, forKey: .latitude)
//        mRT = try values.decode(String.self, forKey: .mRT)
//    }
//}

extension TouristSite : Equatable {
    
    static public func ==(lhs: TouristSite, rhs: TouristSite) -> Bool {
        return lhs._id == rhs._id
    }
    
}

