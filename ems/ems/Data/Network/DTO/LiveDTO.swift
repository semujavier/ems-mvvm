//
//  LiveDTO.swift
//  
//
//  Created by Javier Serrano Muñoz on 18/3/22.
//

import Foundation

struct LiveDTO: Decodable {
    let solarPower: Double
    let quasarsPower: Double
    let buildingDemand: Double
    let systemSoc: Double
    let totalEnergy: Int
    let currentEnergy: Double
}

extension LiveDTO: Mappable {
    func toEntity() -> Live {
        return Live(solarPower: solarPower,
                    quasarsPower: quasarsPower,
                    buildingDemand: buildingDemand,
                    systemSoc: systemSoc,
                    totalEnergy: totalEnergy,
                    currentEnergy: currentEnergy)
    }
}
