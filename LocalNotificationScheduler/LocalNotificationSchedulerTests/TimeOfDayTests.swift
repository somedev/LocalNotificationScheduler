//
//  Created by Eduard Panasiuk on 1/10/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import XCTest
@testable import LocalNotificationScheduler


class TimeOfDayTests: XCTestCase {
    
    func testInitializerEmpty() {
        let time = TimeOfDay()
        XCTAssertEqual(time.hour, 0)
        XCTAssertEqual(time.minute, 0)
        XCTAssertEqual(time.second, 0)
        XCTAssertEqual(time.timeInterval, 0)
    }
    
    func testInitializerHours() {
        let hoursTestValue = 10
        let time = TimeOfDay(hours: hoursTestValue)
        XCTAssertEqual(time.hour, hoursTestValue)
        XCTAssertEqual(time.minute, 0)
        XCTAssertEqual(time.second, 0)
    }
    
    func testInitializerMinutes() {
        let minutesTestValue = 100
        let time = TimeOfDay(minutes: minutesTestValue)
        XCTAssertEqual(time.hour, 1)
        XCTAssertEqual(time.minute, 40)
        XCTAssertEqual(time.second, 0)
    }
    
    func testInitializerSeconds() {
        let minutesTestValue = 10000
        let time = TimeOfDay(seconds: minutesTestValue)
        XCTAssertEqual(time.hour, 2)
        XCTAssertEqual(time.minute, 46)
        XCTAssertEqual(time.second, 40)
    }
    
    func testInitializerHoursMinutesSeconds() {
        let time = TimeOfDay(hours: 2, minutes: 70, seconds: 100)
        XCTAssertEqual(time.hour, 3)
        XCTAssertEqual(time.minute, 11)
        XCTAssertEqual(time.second, 40)
        XCTAssertEqual(time.timeInterval, 11500)
    }
}
