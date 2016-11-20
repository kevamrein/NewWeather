//
//  SettingsViewController.swift
//  NewWeather
//
//  Created by Kevin Amrein on 8/13/16.
//  Copyright © 2016 Kevin Amrein. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var unitSelection: UISegmentedControl!
    @IBOutlet weak var useFeelsLike: UISwitch! {
        get {
            return self.useFeelsLike
        }
        set {
            SetConstants.useFeelsLike = useFeelsLike.isOn
        }
    }
}
