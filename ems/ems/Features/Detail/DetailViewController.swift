//
//  DetailViewController.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 20/3/22.
//

import Foundation
import UIKit
import Charts
import RxSwift

class DetailViewController: UIViewController {
    let viewModel: DetailViewModel
    let disposeBag = DisposeBag()
    @IBOutlet weak var chartView: LineChartView!
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailView", bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        viewModel.loadData()
        bind()
    }
    
    func bind() {
        viewModel.chartData.subscribe(onNext: { [weak self] in
            self?.chartView.data = $0
        }).disposed(by: disposeBag)
    }
    
    func setupChartView() {
        chartView.xAxis.drawLabelsEnabled = false
        chartView.animate(xAxisDuration: 2)
    
    }

}
