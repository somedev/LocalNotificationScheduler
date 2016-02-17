//
//  WeekDays.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 2/17/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

struct WeekDays : OptionSetType {
    let rawValue: UInt
    
    static let Sunday       = WeekDays(rawValue: 1 << 1)
    static let Monday       = WeekDays(rawValue: 1 << 2)
    static let Tuesday      = WeekDays(rawValue: 1 << 3)
    static let Wednesday    = WeekDays(rawValue: 1 << 4)
    static let Thursday     = WeekDays(rawValue: 1 << 5)
    static let Friday       = WeekDays(rawValue: 1 << 6)
    static let Saturday     = WeekDays(rawValue: 1 << 7)
}


extension WeekDays {
    static let WeekEnd:WeekDays = [.Sunday, .Saturday]
    static let WorkWeek:WeekDays = [.Monday, .Tuesday, .Wednesday, .Thursday, .Friday]
    static let Week:WeekDays = [.Monday, .Tuesday, .Wednesday, .Thursday, .Friday, .Sunday, .Saturday]
}