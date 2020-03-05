//
//  CountryService.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import Alamofire
import Foundation

class CountryService: Service {
    
    func getCountries(parser: ParserJSON? = nil, completion: @escaping ServiceCompletionHandler) {
        let partialUrl = BundleConstants.Service.CountryPath
        let url = Service.baseUrl() + partialUrl
        let header: Alamofire.HTTPHeaders = [:]
        
        self.getRequest(url: url, headers: header, parser: parser, completion: completion)
    }
}
