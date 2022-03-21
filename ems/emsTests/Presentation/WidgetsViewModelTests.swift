//
//  WidgetsViewModel.swift
//  emsTests
//
//  Created by Javier Serrano Muñoz on 21/3/22.
//

import XCTest
import RxBlocking
@testable import ems

class WidgetsViewModelTests: XCTestCase {
    var sut: WidgetsViewModel!
    private var navigateCalled: Bool = false
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        navigateCalled = false
    }
    
    func testSuccessOutputs() {
        sut = WidgetsViewModel(liveUseCase: DefaultGetLiveUseCase(liveRepository: LiveRepositoryMock.sample()),
                               historicUseCase: DefaultGetHistoricUseCase(historicRepository: HistoricRepositoryMock.sample()),
                               navigateDetailAction: { })
        
        XCTAssertEqual(try! sut.quasarCharged.toBlocking().first(), "100.000")
        XCTAssertEqual(try! sut.quasarDischarged.toBlocking().first(), "-200.000")
        XCTAssertEqual(try! sut.solarLiveSupply.toBlocking().first(), "100.000")
        XCTAssertEqual(try! sut.gridLiveSupply.toBlocking().first(), "100.000")
        XCTAssertEqual(try! sut.quasarsLiveSupply.toBlocking().first(), "-50.000")
        XCTAssertEqual(try! sut.solarPercentage.toBlocking().first(), "40.00%")
        XCTAssertEqual(try! sut.gridPercentage.toBlocking().first(), "40.00%")
        XCTAssertEqual(try! sut.quasarsPercentage.toBlocking().first(), "20.00%")
    }
    
    func testFailureOutputs() {
        sut = WidgetsViewModel(liveUseCase: DefaultGetLiveUseCase(liveRepository: LiveRepositoryMock.failure()),
                               historicUseCase: DefaultGetHistoricUseCase(historicRepository: HistoricRepositoryMock.failure()),
                               navigateDetailAction: { })
        
        XCTAssertEqual(try! sut.quasarCharged.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.quasarDischarged.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.solarLiveSupply.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.gridLiveSupply.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.quasarsLiveSupply.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.solarPercentage.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.gridPercentage.toBlocking().first(), "N/A")
        XCTAssertEqual(try! sut.quasarsPercentage.toBlocking().first(), "N/A")
    }
}
