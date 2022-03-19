//
//  HistoricDTO.swift
//  
//
//  Created by Javier Serrano Muñoz on 18/3/22.
//

import Foundation

struct HistoricDTO: Decodable {
    let buildingActivePower: Double
    let gridActivePower: Double
    let pvActivePower: Double
    let quasarsActivePower: Double
    let timestamp: String
}

extension HistoricDTO: Mappable {
    func toEntity() -> HistoricItem {
        return HistoricItem(buildingActivePower: buildingActivePower,
                        gridActivePower: gridActivePower,
                        pvActivePower: pvActivePower,
                        quasarsActivePower: quasarsActivePower,
                        timestamp: ISO8601DateFormatter().date(from: timestamp) ?? .distantPast)
    }

}
