//
//  EMSMoya.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation
import Moya

let logger = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))

let provider = MoyaProvider<EMSAPI>(plugins: [logger])
let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

enum EMSAPI {
    case historic
    case live
}

extension EMSAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://gitlab.com/carandahe/ems-demo-project/-/blob/main/")!
    }
    
    var path: String {
        switch self {
        case .historic:
            return "historic_data.json"
        case .live:
            return "live_data.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}