//
//  LiveTests.swift
//  emsTests
//
//  Created by Javier Serrano Muñoz on 20/3/22.
//

import XCTest
@testable import ems

class LiveTests: XCTestCase {

    func testSupplyPercentages() {
        let sut = Live(solarPower: 100, quasarsPower: -100, gridPower: 200, buildingDemand: 400, systemSoc: 100, totalEnergy: 0, currentEnergy: 0)
        
        XCTAssertEqual(25.0, sut.solarSupplyPercentage)
        XCTAssertEqual(25.0, sut.quasarsSupplyPercentage)
        XCTAssertEqual(50.0, sut.gridSupplyPercentage)
    }
    
    func testPositiveQuasars() {
        let sut = Live(solarPower: 100, quasarsPower: 100, gridPower: 200, buildingDemand: 200, systemSoc: 100, totalEnergy: 0, currentEnergy: 0)
        XCTAssertEqual(50, sut.solarSupplyPercentage)
        XCTAssertEqual(-50, sut.quasarsSupplyPercentage)
        XCTAssertEqual(100, sut.gridSupplyPercentage)
    }

}
