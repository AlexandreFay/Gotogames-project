//
//  CountryPickerTableViewCell.swift
//  Gotogames-app
//
//  Created by Alexandre Fay on 05/03/2020.
//  Copyright © 2020 gotogames. All rights reserved.
//

import UIKit

class CountryPickerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
        var country: Country? {
            willSet {
                countryNameLabel.text = newValue?.nameTranslated ?? ""
    //            if let flagUrl = newValue?.flagUrl, let url = URL(string: flagUrl) {
    //                SvgImage(url: url, coder: <#T##NSCoder#>)
    //
    //            }
            }
        }
}
