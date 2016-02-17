//
//  WeekDaysTest.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 2/17/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import XCTest
@testable import LocalNotificationScheduler

class WeekDaysTest: XCTestCase {
    func testWeekend(){
        let weekend = WeekDays.WeekEnd
        XCTAssertTrue(weekend.contains(.Sunday))
        XCTAssertTrue(weekend.contains(.Saturday))
        XCTAssertFalse(weekend.contains(.Monday))
        XCTAssertFalse(weekend.contains(.Tuesday))
        XCTAssertFalse(weekend.contains(.Wednesday))
        XCTAssertFalse(weekend.contains(.Thursday))
        XCTAssertFalse(weekend.contains(.Friday))
    }
    
    func testWorkWeek(){
        let weekend = WeekDays.WorkWeek
        XCTAssertFalse(weekend.contains(.Sunday))
        XCTAssertFalse(weekend.contains(.Saturday))
        XCTAssertTrue(weekend.contains(.Monday))
        XCTAssertTrue(weekend.contains(.Tuesday))
        XCTAssertTrue(weekend.contains(.Wednesday))
        XCTAssertTrue(weekend.contains(.Thursday))
        XCTAssertTrue(weekend.contains(.Friday))
    }
    
    func testWeek(){
        let weekend = WeekDays.Week
        XCTAssertTrue(weekend.contains(.Sunday))
        XCTAssertTrue(weekend.contains(.Saturday))
        XCTAssertTrue(weekend.contains(.Monday))
        XCTAssertTrue(weekend.contains(.Tuesday))
        XCTAssertTrue(weekend.contains(.Wednesday))
        XCTAssertTrue(weekend.contains(.Thursday))
        XCTAssertTrue(weekend.contains(.Friday))
    }
}
