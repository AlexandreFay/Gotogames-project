//
//  CountryPickerViewController.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 04/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

protocol CountryPickerDelegate: class {
    func didSelectCountry(country: Country)
}

class CountryPickerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = CountryPickerViewModel()
    weak var delegate: CountryPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CountryPickerTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryPickerTableViewCell")
        
        viewModel.getCountries { (_, _) in
            self.tableView.reloadData()
        }
    }
}

extension CountryPickerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryPickerTableViewCell", for: indexPath) as? CountryPickerTableViewCell else { return CountryPickerTableViewCell() }
        cell.country = viewModel.getCountry(at: indexPath)
        return cell
    }
}

extension CountryPickerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedCountry = viewModel.getCountry(at: indexPath)
        delegate?.didSelectCountry(country: selectedCountry)
    }
}
