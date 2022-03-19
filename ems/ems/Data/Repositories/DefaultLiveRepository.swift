//
//  DefaultLiveRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxMoya
import RxSwift

class DefaultHistoricRepository: HistoricRepository {
    func getHistoric() -> Observable<[HistoricItem]> {
        provider.rx
            .request(.historic)
            .map([HistoricDTO].self)
            .map {
                $0.map { $0.toEntity() }
            }.asObservable()
    }
}
