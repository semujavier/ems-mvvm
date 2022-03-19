//
//  HistoricRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

protocol HistoricRepository {
    func getHistoric() -> Observable<[HistoricItem]>
}
