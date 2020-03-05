//
//  CountriesParser.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import Foundation

class CountriesParser: ParserJSON {
    
    func parse(data: Data?) -> Any? {
        return parse(data: data, objectType: Array<Country>.self)
    }
}
