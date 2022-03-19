//
//  GetLiveUseCase.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import RxSwift

protocol GetLiveUseCase {
    func execute() -> Observable<Live>
}

public class DefaultGetLiveUseCase: GetLiveUseCase {
    private let liveRepository: LiveRepository
    
    init(liveRepository: LiveRepository) {
        self.liveRepository = liveRepository
    }
    
    func execute() -> Observable<Live> {
        return liveRepository.getLive()
    }
}
