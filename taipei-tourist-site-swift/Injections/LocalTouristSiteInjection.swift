//
//  LocalTouristSiteInjection.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/30.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import RxSwift

typealias persistenceErrorHandler = (PersistenceError?) -> Void

protocol LocalTouristSiteServiceInjected { }

extension LocalTouristSiteServiceInjected {
    
//    var localPokemonService: LocalTouristSiteService { get { return InjectionMap.localService } }
}

protocol LocalTouristSiteService {
//    var localPokemon: Observable<[CapturedPokemon]> { get }
//    func capture(pokemon: WildPokemon, completion: persistenceErrorHandler?)
}
