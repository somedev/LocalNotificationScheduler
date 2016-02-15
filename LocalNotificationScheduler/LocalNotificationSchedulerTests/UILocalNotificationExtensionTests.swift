//
//  UILocalNotificationExtensionTests.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 2/15/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import XCTest
@testable import LocalNotificationScheduler

class UILocalNotificationExtensionTests: XCTestCase {
    func testLocalNotificationWithTime(){
        let time = TimeOfDay(hours: 1, minutes: 2, seconds: 3)
        let testDate = NSDate().futureDateWithTime(time)
        let notification = UILocalNotification.notificationWithTime(time)
        XCTAssertNotNil(notification)
        XCTAssertNotNil(notification.fireDate)
        XCTAssertTrue(testDate.compare(notification.fireDate!) == NSComparisonResult.OrderedSame)
    }
}
