//
//  CountryPickerViewModel.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class CountryPickerViewModel: NSObject {
    
    var countryList: [Country] = []
    
    func getCountries(completion: @escaping SuccessCompletionHandler) {
        let parser = CountriesParser()
        let service = CountryService()
        
        service.getCountries(parser: parser) { (result, success, error) in
            if let countries = result as? [Country] {
                self.countryList = countries
            }
            completion(success, error)
        }
    }
    
    //MARK: Data Source methodes
    
    func numberOfRow() -> Int {
        return countryList.count
    }
    
    func getCountry(at indexPath: IndexPath) -> Country {
        return countryList[indexPath.row]
    }
}
