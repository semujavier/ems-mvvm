//
//  HIstoricRepositoryMock.swift
//  emsTests
//
//  Created by Javier Serrano Muñoz on 21/3/22.
//

import Foundation
import RxSwift
@testable import ems

class HistoricRepositoryMock: HistoricRepository {
    private let items: Observable<[HistoricItem]>
    
    init(items: [HistoricItem]) {
        self.items = .just(items)
    }
    
    init(error: Error) {
        items = .error(error)
    }
    
    func getHistoric() -> Observable<[HistoricItem]> {
        return items
    }
    
    static var sample: () -> HistoricRepository = {
        return HistoricRepositoryMock(items: [
            HistoricItem(
                buildingActivePower: 300,
                gridActivePower: 100,
                pvActivePower: 100,
                quasarsActivePower: -100,
                timestamp: Date()),
            HistoricItem(
                buildingActivePower: 400,
                gridActivePower: 200,
                pvActivePower: 100,
                quasarsActivePower: -100,
                timestamp: Date()),
            HistoricItem(
                buildingActivePower: 200,
                gridActivePower: 200,
                pvActivePower: 100,
                quasarsActivePower: 100,
                timestamp: Date()),
        ])
        
    }
    
    static var failure: () -> HistoricRepository = {
        return HistoricRepositoryMock(error: DataError.unableToLoad)
    }
}

