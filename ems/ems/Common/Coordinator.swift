//
//  Coordinator.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 20/3/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}
