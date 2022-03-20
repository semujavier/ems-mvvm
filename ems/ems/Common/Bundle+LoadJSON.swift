//
//  Bundle+LoadJSON.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import Foundation

let defaultDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

extension Bundle {
    func loadJSON<T: Decodable>(type: T.Type, filename: String, decoder: JSONDecoder = defaultDecoder) -> T? {
        guard let url = self.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return object
    }
}
