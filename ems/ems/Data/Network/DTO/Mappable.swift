//
//  Mappable.swift
//  
//
//  Created by Javier Serrano Muñoz on 18/3/22.
//

import Foundation

protocol Mappable {
    associatedtype Entity
    func toEntity() -> Entity
}

