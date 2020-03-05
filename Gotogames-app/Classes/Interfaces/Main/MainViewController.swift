//
//  MainViewController.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var countryPickerViewController: CountryPickerViewController?
    var countryInformationsViewController: CountryInformationsViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CountryPickerSegue" {
            countryPickerViewController = segue.destination as? CountryPickerViewController
            countryPickerViewController?.delegate = self
        } else if segue.identifier == "CountryInformationsSegue" {
            countryInformationsViewController = segue.destination as? CountryInformationsViewController
        }
    }
}

extension MainViewController: CountryPickerDelegate {
    
    func didSelectCountry(country: Country) {
        countryInformationsViewController?.selectedCountry = country
    }
}
