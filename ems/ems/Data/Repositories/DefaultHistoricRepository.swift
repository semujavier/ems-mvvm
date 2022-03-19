//
//  DefaultHistoricRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxMoya
import RxSwift

class DefaultLiveRepository: LiveRepository {
    func getLive() -> Observable<Live> {
        provider.rx
            .request(.live)
            .map(LiveDTO.self)
            .map {$0.toEntity()
            }.asObservable()
    }
}
