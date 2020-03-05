//
//  Country.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import Foundation

struct Country: Codable {
    
    let nameTranslated: String?
    let flagUrl: String?
    let capitalCityName: String?
    
    private enum CodingKeys: String, CodingKey {
        case translations = "translations"
        case name = "name"
        case nameTranslated = "fr"
        case flagUrl = "flag"
        case capitalCityName = "capital"
    }
    
    // Decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flagUrl = try container.decodeIfPresent(String.self, forKey: .flagUrl)
        capitalCityName = try container.decodeIfPresent(String.self, forKey: .capitalCityName)
        
        let translations = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .translations)
        nameTranslated = try translations.decodeIfPresent(String.self, forKey: .nameTranslated) ?? container.decodeIfPresent(String.self, forKey: .name)
    }
    
    // Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(flagUrl, forKey: .flagUrl)
        try container.encodeIfPresent(capitalCityName, forKey: .capitalCityName)
        
        var translations = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .translations)
        try translations.encodeIfPresent(nameTranslated, forKey: .nameTranslated)
    }
}
