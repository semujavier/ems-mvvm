//
//  WidgetsViewModel.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift
import RxCocoa

final class WidgetsViewModel {
    let quasarCharged: Driver<String>
    let quasarDischarged: Driver<String>
    let solarLiveSupply: Driver<String>
    let gridLiveSupply: Driver<String>
    let quasarsLiveSupply: Driver<String>
    let solarPercentage: Driver<String>
    let gridPercentage: Driver<String>
    let quasarsPercentage: Driver<String>
    
    private let navigateDetailAction: () -> Void
    
    init(liveUseCase: GetLiveUseCase,
         historicUseCase: GetHistoricUseCase,
         navigateDetailAction: @escaping () -> Void
    ) {
        let historic = historicUseCase.execute()
        let live = liveUseCase.execute()
        self.navigateDetailAction = navigateDetailAction
                
        solarLiveSupply = live
            .map { $0.solarPower.toDecimal()}
            .asDriver(onErrorJustReturn: "N/A")
        
        gridLiveSupply = live
            .map { $0.gridPower.toDecimal() }
            .asDriver(onErrorJustReturn: "N/A")
        
        quasarsLiveSupply = live
            .map { $0.quasarsPower.toDecimal() }
            .asDriver(onErrorJustReturn: "N/A")
        
        solarPercentage = live
            .map { "\($0.solarSupplyPercentage.toPercentageString())"}
            .asDriver(onErrorJustReturn: "N/A")
        
        gridPercentage = live
            .map { "\($0.gridSupplyPercentage.toPercentageString())"}
            .asDriver(onErrorJustReturn: "N/A")
        
        quasarsPercentage = live
            .map { "\($0.quasarsSupplyPercentage.toPercentageString())"}
            .asDriver(onErrorJustReturn: "N/A")
        
        quasarDischarged = historic.map {
            let discharged = $0.filter { $0.quasarsActivePower < 0}.map {
                $0.quasarsActivePower
            }.reduce(0,+)
            return discharged.toDecimal()
        }.asDriver(onErrorJustReturn: "N/A")
        
        quasarCharged = historic.map {
            let charged = $0.filter { $0.quasarsActivePower > 0}.map {
                $0.quasarsActivePower
            }.reduce(0,+)
            return charged.toDecimal()
        }.asDriver(onErrorJustReturn: "N/A")
    }
    
    func navigateDetail() {
        navigateDetailAction()
    }
}
