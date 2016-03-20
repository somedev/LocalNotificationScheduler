//
//  WeekDays.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 2/17/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public enum WeekDays : Int {
    case None = 0
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

public extension WeekDays {
    static func week() -> Array<WeekDays>{
        return [.Sunday, .Monday, .Tuesday, .Wednesday, .Thursday, .Friday, .Saturday]
    }
    
    static func weekEnd() -> Array<WeekDays>{
        return [.Saturday, .Sunday]
    }
    
    static func workWeek() -> Array<WeekDays>{
        return [.Monday, .Tuesday, .Wednesday, .Thursday, .Friday]
    }
}

public extension NSDate {
    func weekDay() -> WeekDays{
        guard let georgianCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian) else {
            return .None
        }
        let components = georgianCalendar.components(NSCalendarUnit.Weekday, fromDate: self)
        return WeekDays(rawValue: components.weekday) ?? .None
    }
}
