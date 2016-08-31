//
//  MainPageController.swift
//  NewWeather
//
//  Created by Kevin Amrein on 7/31/16.
//  Copyright © 2016 Kevin Amrein. All rights reserved.
//

import UIKit
import SwiftCharts

class MainPageViewController: UIViewController {

    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cityLabel: NSLayoutConstraint!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (SetConstants.useFeelsLike) {
            feelsLikeLabel.hidden = false
        } else {
            feelsLikeLabel.hidden = true
        }
        
    }
}

