//
//  GetHistoricUseCase.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

protocol GetHistoricUseCase {
    func execute() -> Observable<[HistoricItem]>
}

public class DefaultGetHistoricUseCase: GetHistoricUseCase {
    private let historicRepository: HistoricRepository
    
    init(historicRepository: HistoricRepository) {
        self.historicRepository = historicRepository
    }
    
    func execute() -> Observable<[HistoricItem]> {
        return historicRepository.getHistoric()
    }
}
