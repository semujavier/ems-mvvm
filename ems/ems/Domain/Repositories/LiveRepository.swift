//
//  LiveRepository+.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

protocol LiveRepository {
    func getLive() -> Observable<Live>
}
