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

class SetTimeLocationViewController : UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {
    @IBOutlet weak var thirtyMinutesButton: UIButton!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!

    
    @IBOutlet weak var setTimeLocationButton: UIButton!
    @IBOutlet weak var twoHoursButton: UIButton!
    @IBOutlet weak var oneHourButton: UIButton!

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var currentTimeButton: UIButton!
    @IBOutlet weak var currentLocationButton: UIButton!
    
    var resultSearchController:UISearchController? = nil
    
    let locationDelegate = SetConstants.locationManager.delegate
    
    var settingTime : Bool = false
    var settingFrom : Bool = false
    
    override func viewDidLoad() {
        // Set the visibility of the UI Elements
        
        thirtyMinutesButton.isHidden = true
        setTimeLocationButton.isHidden = true
        twoHoursButton.isHidden = true
        oneHourButton.isHidden = true
        currentTimeButton.isHidden = false
        currentLocationButton.isHidden = false
        datePicker.isHidden = true
        SetConstants.locationManager.delegate = self
        
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true

    }

    @IBAction func useCurrentLocation(_ sender: AnyObject) {
        
        // Will only show message if invalid Authorization status
        SetConstants.locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways) {
            
            SetConstants.locationManager.requestLocation()
        }
    }
    @IBAction func useCurrentTime(_ sender: AnyObject) {
        
    }
    @IBAction func thirtyMinutes(_ sender: AnyObject) {
        defaultTimeChosen(SetConstants.THIRTY_MINUTES)
    }
    @IBAction func oneHour(_ sender: AnyObject) {
        defaultTimeChosen(SetConstants.ONE_HOUR)
    }
    @IBAction func twoHours(_ sender: AnyObject) {
        defaultTimeChosen(SetConstants.TWO_HOURS)
    }
    @IBAction func setTimeLocation(_ sender: AnyObject) {
        //areaLabel.text = SetConstants.location.description
    }
    
    @IBAction func fromClicked(_ sender: UITapGestureRecognizer) {
        settingFrom = true
        settingTime(fromLabel)
    }
    
    
    @IBAction func toClicked(_ sender: AnyObject) {
        settingFrom = false
        settingTime(toLabel)
    }
    
    // Touch up outside event to close the picker and get rid of the time buttons
    @IBAction func dateTimeSet(_ sender: AnyObject) {
        settingTime = false
        settingTime(fromLabel)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        SetConstants.location = locations.last!
        
        //locationSearchBar.text = SetConstants.location.description  // TODO: description wont work it give too much detail
    }
    
    
    func settingTime(_ labelToSet : UILabel) {
        // Make the datepicker and time buttons appear
        datePicker.isHidden = false;
        thirtyMinutesButton.isHidden = false
        oneHourButton.isHidden = false
        twoHoursButton.isHidden = false
        settingTime = false
    }
    
    fileprivate func defaultTimeChosen(_ time : Double) {
        if (settingFrom) {
            SetConstants.fromTime = Date()
            SetConstants.toTime = Date()
            SetConstants.toTime = SetConstants.toTime.addingTimeInterval(time)
        } else {
            SetConstants.toTime = SetConstants.fromTime.addingTimeInterval(time)
        }
        fromLabel.text = SetConstants.fromTime.description
        toLabel.text = SetConstants.toTime.description
    }
}
