//
//  WeekDays.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 2/17/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public enum WeekDays : Int {
    case none = 0
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

public extension WeekDays {
    static func week() -> Array<WeekDays>{
        return [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
    }
    
    static func weekEnd() -> Array<WeekDays>{
        return [.saturday, .sunday]
    }
    
    static func workWeek() -> Array<WeekDays>{
        return [.monday, .tuesday, .wednesday, .thursday, .friday]
    }
}

public extension Date {
    func weekDay() -> WeekDays{
        guard let georgianCalendar = Calendar(calendarIdentifier:Calendar.Identifier.gregorian) else {
            return .none
        }
        let components = georgianCalendar.components(Calendar.Unit.weekday, from: self)
        return WeekDays(rawValue: components.weekday!) ?? .none
    }
}
