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
    
    let secondsInHour:TimeInterval = 3600
    
    //MARK: - tests
    
    func testFutureDateWithHoursThisDay() {
        
        let  testDate = Calendar.current().startOfDay(for: Date())
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17))
        XCTAssert(Calendar.current().isDate(testDate, inSameDayAs: Calendar.current().startOfDay(for: result)))
        self.check(15, minute: 16, second: 17, forDate: result)
    }
    
    
    func testFutureDateWithHoursNextDay() {
        let  testDate = Calendar.current().startOfDay(for: Date()).addingTimeInterval(secondsInHour * 10)
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 1, minutes: 2, seconds: 3))
        XCTAssertFalse(Calendar.current().isDate(Calendar.current().startOfDay(for: testDate), inSameDayAs: Calendar.current().startOfDay(for: result)))
        self.check(1, minute: 2, second: 3, forDate: result)
    }
    
    func testFutureDateWithHoursWeekdayThisDay() {
        let  testDate = Calendar.current().startOfDay(for: Date())
        let components = Calendar.current().components([.weekday], from: testDate)
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17), weekDay: WeekDays(rawValue: components.weekday!)!)
        XCTAssert(Calendar.current().isDate(testDate, inSameDayAs: Calendar.current().startOfDay(for: result)))
        self.check(15, minute: 16, second: 17, forDate: result)
        XCTAssert(testDate.weekDay().rawValue == result.weekDay().rawValue)
    }
    
    func testFutureDateWithHoursNextWeek() {
        let  testDate = Calendar.current().startOfDay(for: Date()).addingTimeInterval(secondsInHour * 10)
        let components = Calendar.current().components([.weekday], from: testDate)
        var weekday = components.weekday
        weekday = weekday! - 1
        if(weekday < 1){
            weekday = 7
        }
        let weekDayValue = WeekDays(rawValue: weekday!)!
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17), weekDay: WeekDays(rawValue: weekday!)!)
        XCTAssertFalse(Calendar.current().isDate(Calendar.current().startOfDay(for: testDate), inSameDayAs: Calendar.current().startOfDay(for: result)))
        self.check(15, minute: 16, second: 17, forDate: result)
        XCTAssert(weekDayValue.rawValue == result.weekDay().rawValue)
    }

    //MARK: - utils
    private func check(_ hour:Int, minute:Int, second:Int, forDate:Date){
        XCTAssert(Calendar.current().component(Calendar.Unit.hour, from: forDate) == hour)
        XCTAssert(Calendar.current().component(Calendar.Unit.minute, from: forDate) == minute)
        XCTAssert(Calendar.current().component(Calendar.Unit.second, from: forDate) == second)
    }
}
