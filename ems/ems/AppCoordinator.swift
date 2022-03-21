//
//  AppCoordinator.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 20/3/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigateWidgets()
    }
    
    func navigateWidgets() {
        let viewController = WidgetsViewController(
            viewModel: WidgetsViewModel(
                liveUseCase: DefaultGetLiveUseCase(
                    liveRepository: MainBundleLiveRepository()),
                historicUseCase: DefaultGetHistoricUseCase(
                    historicRepository: MainBundleHistoricRepository()), navigateDetailAction: self.navigateDetail))
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateDetail() {
        let detailViewController = DetailViewController(
            viewModel: DetailViewModel(
                historicUseCase: DefaultGetHistoricUseCase(
                    historicRepository: MainBundleHistoricRepository())))
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
