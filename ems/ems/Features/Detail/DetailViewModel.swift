//
//  DetailViewModel.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 20/3/22.
//

import Foundation
import RxSwift
import Charts
import UIKit

final class DetailViewModel {
    var chartData: Observable<LineChartData> = .just(LineChartData())
    let historicUseCase: GetHistoricUseCase
    
    init(historicUseCase: GetHistoricUseCase) {
        self.historicUseCase = historicUseCase
    }
    
    func loadData() {
        chartData = historicUseCase.execute().map { [unowned self] historic in
            
            var lineChartSets = [LineChartDataSet]()
            let gridHistoric = historic.map { ChartDataEntry(x: $0.timestamp.timeIntervalSince1970, y: $0.gridActivePower)}
            let solarHistoric = historic.map { ChartDataEntry(x: $0.timestamp.timeIntervalSince1970, y: $0.pvActivePower)}
            let quasarHistoric = historic.map { ChartDataEntry(x: $0.timestamp.timeIntervalSince1970, y: $0.quasarsActivePower)}
            
            lineChartSets.append(self.createDataSet(entries: gridHistoric, label: "Grid", color: .blue))
            lineChartSets.append(self.createDataSet(entries: solarHistoric, label: "Solar", color: .yellow))
            lineChartSets.append(self.createDataSet(entries: quasarHistoric, label: "Quasar", color: .darkGray))
            return LineChartData(dataSets: lineChartSets)
        }
    }
    
    private func createDataSet(entries: [ChartDataEntry], label: String, color: UIColor) -> LineChartDataSet{
        let dataSet = LineChartDataSet(entries: entries, label: label)
        dataSet.mode = .cubicBezier
        dataSet.drawCirclesEnabled = false
        dataSet.lineWidth = 2
        dataSet.setColor(color)
        return dataSet
    }
}
