//
// Created by Eduard Panasiuk on 12/28/15.
// Copyright (c) 2015 somedev. All rights reserved.
//


import XCTest
import Foundation
@testable import LocalNotificationScheduler

class NotificationSchedulerTests: XCTestCase {
    //MARK: - Tests
    let scheduler:NotificationScheduler = NotificationScheduler.sharedInstance

    override func setUp() {
        super.setUp()
        self.scheduler.notificationManager = NotificationManagerMock()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSingleton() {
        let secondScheduler:NotificationScheduler? = NotificationScheduler.sharedInstance
        XCTAssertNotNil(secondScheduler)
        XCTAssertTrue(self.scheduler === secondScheduler, "Singleton instance should be the same object")
    }

    func testNotThrowsWhenAddingOneNotification(){
        XCTAssertNoThrow(try self.scheduler.scheduleNotification(UILocalNotification()))
    }
    
    func testThrowsWhenAddingTooMany(){
        for _ in 0..<self.scheduler.maxNotificationsCount {
            XCTAssertNoThrow(try self.scheduler.scheduleNotification(UILocalNotification()))
        }
        XCTAssertThrows(try self.scheduler.scheduleNotification(UILocalNotification()))
    }
}


extension XCTest {
    func XCTAssertThrows<T>(@autoclosure expression: () throws -> T, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
        do {
            try expression()
            XCTFail("No error to catch! - \(message)", file: file, line: line)
        } catch {
        }
    }

    func XCTAssertNoThrow<T>(@autoclosure expression: () throws -> T, _ message: String = "", file: String = __FILE__, line: UInt = __LINE__) {
        do {
            try expression()
        } catch let error {
            XCTFail("Caught error: \(error) - \(message)", file: file, line: line)
        }
    }
}
