//
//  Parser.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import Foundation

protocol ParserJSON {
    func parse(data: Data?) -> Any?
    func parse<T: Codable>(data: Data?, objectType: T.Type) -> T?
}

extension ParserJSON {

    func parse<T: Codable>(data: Data?, objectType: T.Type) -> T? {
        guard let data = data else { return nil }
        
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data) as T
            return result
        } catch let error {
            print("🛑 Parser error : \(error) 🛑")
        }
        return nil
    }
}
