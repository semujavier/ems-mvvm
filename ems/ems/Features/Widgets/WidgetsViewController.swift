//
//  HistoricViewController.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

final class WidgetsViewController: UIViewController {
    
    private var viewModel: WidgetsViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var chargedEnergyLabel: UILabel!
    @IBOutlet weak var dischargedEnergyLabel: UILabel!
    @IBOutlet weak var liveSolarPowerLabel: UILabel!
    @IBOutlet weak var liveGridPowerLabel: UILabel!
    @IBOutlet weak var liveQuasarsPowerLabel: UILabel!
    @IBOutlet weak var solarPercentageLabel: UILabel!
    @IBOutlet weak var gridPercentageLabel: UILabel!
    @IBOutlet weak var quasarPercentageLabel: UILabel!
    
    init(viewModel: WidgetsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "WidgetsView", bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        viewModel
            .quasarCharged
            .drive(chargedEnergyLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .quasarDischarged
            .drive(dischargedEnergyLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .solarLiveSupply
            .drive(liveSolarPowerLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .gridLiveSupply
            .drive(liveGridPowerLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .quasarsLiveSupply
            .drive(liveQuasarsPowerLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .gridPercentage
            .drive(gridPercentageLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .quasarsPercentage
            .drive(quasarPercentageLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel
            .solarPercentage
            .drive(solarPercentageLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
