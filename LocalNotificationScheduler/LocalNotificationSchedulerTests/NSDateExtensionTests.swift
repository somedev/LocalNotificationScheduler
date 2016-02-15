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
    
    func testFutureDateWithHoursThisDay() {
        
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 15, minutes: 16, seconds: 17))
        XCTAssert(NSCalendar.currentCalendar().isDate(testDate, inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: result) == 15)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Minute, fromDate: result) == 16)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Second, fromDate: result) == 17)
    }
    
    
    func testFutureDateWithHoursNextDay() {
        let  testDate = NSCalendar.currentCalendar().startOfDayForDate(NSDate()).dateByAddingTimeInterval(secondsInHour * 10)
        let result = testDate.futureDateWithTime(TimeOfDay(hours: 1, minutes: 2, seconds: 3))
        XCTAssertFalse(NSCalendar.currentCalendar().isDate(NSCalendar.currentCalendar().startOfDayForDate(testDate), inSameDayAsDate: NSCalendar.currentCalendar().startOfDayForDate(result)))
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: result) == 1)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Minute, fromDate: result) == 2)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Second, fromDate: result) == 3)
        XCTAssert(NSCalendar.currentCalendar().component(NSCalendarUnit.Minute, fromDate: result) == 2)

    }
}
