//
//  CountryInformationsViewController.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

protocol CountryInformationsDelegate: class {
    func didSelectCardButton()
}

class CountryInformationsViewController: UIViewController {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalCityNameLabel: UILabel!
    
    weak var delegate: CountryInformationsDelegate?
    
    var selectedCountry: Country? {
        willSet {
            countryNameLabel.text = String(format: "country_name".localized, newValue?.nameTranslated ?? "")
            capitalCityNameLabel.text = String(format: "capital_city_name".localized, newValue?.capitalCityName ?? "")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryNameLabel.text = String(format: "country_name".localized, "")
        capitalCityNameLabel.text = String(format: "capital_city_name".localized, "")
    }

    @IBAction func showCardButtonSelected(_ sender: Any) {
        delegate?.didSelectCardButton()
    }
}
