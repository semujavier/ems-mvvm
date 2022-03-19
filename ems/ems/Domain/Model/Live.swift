//
//  File.swift
//  
//
//  Created by Javier Serrano Muñoz on 18/3/22.
//

import Foundation

public struct Live: Codable {
    public let solarPower: Double
    public let quasarsPower: Double
    public let buildingDemand: Double
    public let systemSoc: Double
    public let totalEnergy: Int
    public let currentEnergy: Double
    
    public init(solarPower: Double,
                quasarsPower: Double,
                buildingDemand: Double,
                systemSoc: Double,
                totalEnergy: Int,
                currentEnergy: Double) {
        self.solarPower = solarPower
        self.quasarsPower = quasarsPower
        self.buildingDemand = buildingDemand
        self.systemSoc = systemSoc
        self.totalEnergy = totalEnergy
        self.currentEnergy = currentEnergy
    }
}
