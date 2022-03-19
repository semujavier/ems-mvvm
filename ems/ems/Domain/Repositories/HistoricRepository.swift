//
//  HistoricRepository.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation

protocol HistoricRepository {
    func getHistoric() -> [HistoricItem]
}
