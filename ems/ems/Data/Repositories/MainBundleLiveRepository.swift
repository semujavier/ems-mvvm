//
//  DefaultHistoricRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

enum DataError: Error {
    case unableToLoad
}

class MainBundleLiveRepository: LiveRepository {
    func getLive() -> Observable<Live> {
        Single<LiveDTO>.create { single in
            if let liveData = Bundle.main.loadJSON(type: LiveDTO.self, filename: "live_data") {
                single(.success(liveData))
            } else {
                single(.failure((DataError.unableToLoad)))
            }
            return Disposables.create()
        }.map { $0.toEntity() }
            .asObservable()
    }
}
