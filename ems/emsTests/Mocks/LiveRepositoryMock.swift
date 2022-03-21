//
//  LiveRepositoryMock.swift
//  emsTests
//
//  Created by Javier Serrano Muñoz on 21/3/22.
//

import Foundation
import RxSwift
@testable import ems

class LiveRepositoryMock: LiveRepository {
    private let live: Observable<Live>
    
    init(live: Live) {
        self.live = .just(live)
    }
    
    init(error: Error) {
        live = .error(error)
    }
    
    func getLive() -> Observable<Live> {
        return live
    }
    
    static var sample: () -> LiveRepository = {
        return LiveRepositoryMock(live:
                                    Live(solarPower: 100,
                                         quasarsPower: -50,
                                         gridPower: 100,
                                         buildingDemand: 250,
                                         systemSoc: 100,
                                         totalEnergy: 100,
                                         currentEnergy: 100))
    }
    
    static var failure: () -> LiveRepository = {
        return LiveRepositoryMock(error: DataError.unableToLoad)
    }
    
}
