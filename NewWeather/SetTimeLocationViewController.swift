//
//  SetTimeLocationViewController.swift
//  NewWeather
//
//  Created by Kevin Amrein on 8/31/16.
//  Copyright © 2016 Kevin Amrein. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class SetTimeLocationViewController : UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var thirtyMinutesButton: UIButton!
    
    @IBOutlet weak var setTimeLocationButton: UIButton!
    @IBOutlet weak var twoHoursButton: UIButton!
    @IBOutlet weak var oneHourButton: UIButton!

    @IBOutlet weak var currentTimeButton: UIButton!
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let locationDelegate = SetConstants.locationManager.delegate
    
    override func viewDidLoad() {
        // Set the visibility of the UI Elements
        areaLabel.hidden = false
        locationSearchBar.hidden = false
        thirtyMinutesButton.hidden = true
        setTimeLocationButton.hidden = true
        twoHoursButton.hidden = true
        oneHourButton.hidden = true
        currentTimeButton.hidden = false
        currentLocationButton.hidden = false
        datePicker.hidden = true
    
    }
    
    @IBAction func useCurrentLocation(sender: AnyObject) {
        
        // Will only show message if invalid Authorization status
        SetConstants.locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus() == .AuthorizedAlways) {
            
            SetConstants.locationManager.requestLocation()
        }
    }
    @IBAction func useCurrentTime(sender: AnyObject) {
    }
    @IBAction func thirtyMinutes(sender: AnyObject) {
    }
    @IBAction func oneHour(sender: AnyObject) {
    }
    @IBAction func twoHours(sender: AnyObject) {
    }
    @IBAction func setTimeLocation(sender: AnyObject) {
        areaLabel.text = SetConstants.location.description
    }
    
    // Touch up outside event to close the picker and get rid of the time buttons
    @IBAction func dateTimeSet(sender: AnyObject) {
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        SetConstants.location = locations.last!
        
        locationSearchBar.text = SetConstants.location.description
    }
}
