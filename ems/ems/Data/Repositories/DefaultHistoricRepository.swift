//
//  DefaultLiveRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

class DefaultHistoricRepository: HistoricRepository {
    func getHistoric() -> Observable<[HistoricItem]> {
        Single<[HistoricDTO]>.create { single in
            if let liveData = Bundle.main.loadJSON(type: [HistoricDTO].self, filename: "historic_data") {
                single(.success(liveData))
            } else {
                single(.failure((DataError.unableToLoad)))
            }
            return Disposables.create()
        }.map { $0.map {$0.toEntity() } }
            .asObservable()
    }
}
