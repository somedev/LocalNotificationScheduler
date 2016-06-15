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
        self.checkDateWithWeekday(1, weekday: .sunday)
        self.checkDateWithWeekday(2, weekday: .monday)
        self.checkDateWithWeekday(3, weekday: .tuesday)
        self.checkDateWithWeekday(4, weekday: .wednesday)
        self.checkDateWithWeekday(5, weekday: .thursday)
        self.checkDateWithWeekday(6, weekday: .friday)
        self.checkDateWithWeekday(7, weekday: .saturday)
    }
    
    //MARK: - private helpers
    private func checkDateWithWeekday(_ dayNumber:Int, weekday:WeekDays){
        guard let georgianCalendar = Calendar(calendarIdentifier:Calendar.Identifier.gregorian) else {
            XCTFail()
            return
        }
        var components = georgianCalendar.components([.year, .weekOfMonth, .hour, .minute], from: Date())
        components.weekday = dayNumber
        guard let date = georgianCalendar.date(from: components) else {
            XCTFail()
            return
        }
        XCTAssert(date.weekDay().rawValue == weekday.rawValue)
    }
    
}
