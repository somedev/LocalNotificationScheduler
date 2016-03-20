////
////  WeekDaysTest.swift
////  LocalNotificationScheduler
////
////  Created by Eduard Panasiuk on 2/17/16.
////  Copyright © 2016 somedev. All rights reserved.
////
//
import XCTest
@testable import LocalNotificationScheduler

class WeekDaysTest: XCTestCase {
    func testDayOfWeek(){
        self.checkDateWithWeekday(1, weekday: .Sunday)
        self.checkDateWithWeekday(2, weekday: .Monday)
        self.checkDateWithWeekday(3, weekday: .Tuesday)
        self.checkDateWithWeekday(4, weekday: .Wednesday)
        self.checkDateWithWeekday(5, weekday: .Thursday)
        self.checkDateWithWeekday(6, weekday: .Friday)
        self.checkDateWithWeekday(7, weekday: .Saturday)
    }
    
    //MARK: - private helpers
    private func checkDateWithWeekday(dayNumber:Int, weekday:WeekDays){
        guard let georgianCalendar = NSCalendar(calendarIdentifier:NSCalendarIdentifierGregorian) else {
            XCTFail()
            return
        }
        let components = georgianCalendar.components([.Year, .WeekOfMonth, .Hour, .Minute], fromDate: NSDate())
        components.weekday = dayNumber
        guard let date = georgianCalendar.dateFromComponents(components) else {
            XCTFail()
            return
        }
        XCTAssert(date.weekDay().rawValue == weekday.rawValue)
    }
    
}
