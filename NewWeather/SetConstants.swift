//
//  SetConstants.swift
//  NewWeather
//
//  Created by Kevin Amrein on 8/13/16.
//  Copyright © 2016 Kevin Amrein. All rights reserved.
//

import Foundation
import CoreLocation

/**
 Where the settings are located including the selected times, location,
 and settings.
*/
class SetConstants {
    // Constants
    static let THIRTY_MINUTES : Double = 1800
    static let ONE_HOUR : Double = 3600
    static let TWO_HOURS : Double = 7200
    
    
    // TODO: change the getters to retieve the current values from the CoreData database
    static var useFahrenheit: Bool {
        get {
            return self.useFahrenheit
        }
        set(useFahrenheit) {
            self.useFahrenheit = useFahrenheit
        }
    }
    static var location: CLLocation {
        get {
            return self.location
        }
        set(location) {
            self.location = location
        }
    }
    static var fromTime: Date {
        get {
            return self.fromTime
        }
        set(fromTime) {
            self.fromTime = fromTime
        }
    }
    static var toTime: Date {
        get {
            return self.toTime
        }
        set(toTime) {
            self.toTime = toTime
        }
    }
    
    static var useFeelsLike: Bool {
        get {
            return self.useFeelsLike
        }
        set(useFeelsLike) {
            self.useFeelsLike = useFeelsLike
        }
    }
    
    static let locationManager = CLLocationManager()
}
