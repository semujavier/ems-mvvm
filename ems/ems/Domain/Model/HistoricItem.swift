//
//  File.swift
//  
//
//  Created by Javier Serrano Muñoz on 18/3/22.
//

import Foundation

public struct HistoricItem: Codable {
    public let buildingActivePower: Double
    public let gridActivePower: Double
    public let pvActivePower: Double
    public let quasarsActivePower: Double
    public let timestamp: Date
    
    public init(buildingActivePower: Double,
                gridActivePower: Double,
                pvActivePower: Double,
                quasarsActivePower: Double,
                timestamp: Date) {
        self.buildingActivePower = buildingActivePower
        self.gridActivePower = gridActivePower
        self.pvActivePower = pvActivePower
        self.quasarsActivePower = quasarsActivePower
        self.timestamp = timestamp
    }
}
