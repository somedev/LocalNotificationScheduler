//
//  NSDateExtensionTests.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 1/12/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import XCTest
@testable import LocalNotificationScheduler

class NSDateExtensionTests: XCTestCase {
    
    let secondsInHour:NSTimeInterval = 3600
    
    //MARK: - tests
    
    func testFutureDateWithHoursThisDay() {
        
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17))
        XCTAssert(NSCalendar.currentCalendar().isDate(testDate, inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        self.check(15, minute: 16, second: 17, forDate: result)
    }
    
    
    func testFutureDateWithHoursNextDay() {
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate()).dateByAddingTimeInterval(secondsInHour * 10)
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 1, minutes: 2, seconds: 3))
        XCTAssertFalse(NSCalendar.currentCalendar().isDate(NSCalendar.currentCalendar().startOfDayForDate(testDate), inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        self.check(1, minute: 2, second: 3, forDate: result)
    }
    
    func testFutureDateWithHoursWeekdayThisDay() {
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
        let components = NSCalendar.currentCalendar().components([.Weekday], fromDate: testDate)
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17), weekDay: WeekDays(rawValue: components.weekday)!)
        XCTAssert(NSCalendar.currentCalendar().isDate(testDate, inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        self.check(15, minute: 16, second: 17, forDate: result)
        XCTAssert(testDate.weekDay().rawValue == result.weekDay().rawValue)
    }
    
    func testFutureDateWithHoursNextWeek() {
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate()).dateByAddingTimeInterval(secondsInHour * 10)
        let components = NSCalendar.currentCalendar().components([.Weekday], fromDate: testDate)
        var weekday = components.weekday
        weekday = weekday - 1
        if(weekday < 1){
            weekday = 7
        }
        let weekDayValue = WeekDays(rawValue: weekday)!
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17), weekDay: WeekDays(rawValue: weekday)!)
        XCTAssertFalse(NSCalendar.currentCalendar().isDate(NSCalendar.currentCalendar().startOfDayForDate(testDate), inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        self.check(15, minute: 16, second: 17, forDate: result)
        XCTAssert(weekDayValue.rawValue == result.weekDay().rawValue)
    }

    //MARK: - utils
    private func check(hour:Int, minute:Int, second:Int, forDate:NSDate){
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: forDate) == hour)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Minute, fromDate: forDate) == minute)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Second, fromDate: forDate) == second)
    }
}
