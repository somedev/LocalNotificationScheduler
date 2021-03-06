//
// Created by Eduard Panasiuk on 12/28/15.
// Copyright (c) 2015 somedev. All rights reserved.
//


import XCTest
import Foundation
@testable import LocalNotificationScheduler

class LocalNotificationSchedulerTests: XCTestCase {

    //MARK: - Constants
    let scheduler: LocalNotificationScheduler = LocalNotificationScheduler.sharedInstance

    //MARK: - Tests
    override func setUp() {
        super.setUp()
        self.scheduler.notificationManager = NotificationManagerTypeMock()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSingleton() {
        let secondScheduler: LocalNotificationScheduler? = LocalNotificationScheduler.sharedInstance
        XCTAssertNotNil(secondScheduler)
        XCTAssertTrue(self.scheduler === secondScheduler, "Singleton instance should be the same object")
    }
    
    func testSuccessWhenAddingOneNotification(){
        let expectation  = self.expectation(withDescription: "testSuccessWhenAddingOneNotification")
        let note = UILocalNotification()
        XCTAssertNoThrow(try self.scheduler.scheduleNotification(note, callback: {(notification) -> () in
            expectation.fulfill()
            XCTAssertTrue(note === notification, "UILocalNotification instance in callback should be the same object")
        }))
        waitForExpectations(withTimeout: 0.1) { _ -> Void in }
    }
    
    func testThrowsWhenAddingOneNotification(){
        let notifications = self.generateMaxNumberNotifications()
        let expectation  = self.expectation(withDescription: "testThrowsWhenAddingOneNotification")
        XCTAssertNoThrow(try self.scheduler.scheduleNotifications(notifications, callback: {(result) -> () in
            expectation.fulfill()
            XCTAssertTrue(notifications.count == result.count, "")
        }))
        waitForExpectations(withTimeout: 0.1) { _ -> Void in }

        XCTAssertThrows(try self.scheduler.scheduleNotification(UILocalNotification()))
    }
    
    func testSuccessWhenAddingManyNotifications(){
        let expectation  = self.expectation(withDescription: "testSuccessWhenAddingManyNotifications")
        let notifications = self.generateMaxNumberNotifications()
        XCTAssertNoThrow(try self.scheduler.scheduleNotifications(notifications, callback: {(result) -> () in
            expectation.fulfill()
            XCTAssertTrue(notifications.count == result.count, "")
        }))
        waitForExpectations(withTimeout: 0.1) { _ -> Void in }
    }
    
    func testThrowsWhenAddingManyNotifications(){
        var notifications = self.generateMaxNumberNotifications()
        notifications.append(UILocalNotification())
        XCTAssertThrows(try self.scheduler.scheduleNotifications(notifications))
    }
    
    
    
    //MARK: - Helpers
    func generateMaxNumberNotifications() -> [UILocalNotification]{
        var notifications:[UILocalNotification] = []
        for _ in 0..<UILocalNotification.maxNotificationsCount() {
            notifications.append(UILocalNotification())
        }
        return notifications
    }

}


extension XCTest {
    func XCTAssertThrows<T>( _ expression: @autoclosure() throws -> T, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
        do {
            try expression()
            XCTFail("No error to catch! - \(message)", file: file, line: line)
        } catch {
        }
    }

    func XCTAssertNoThrow<T>( _ expression: @autoclosure() throws -> T, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
        do {
            try expression()
        } catch let error {
            XCTFail("Caught error: \(error) - \(message)", file: file, line: line)
        }
    }
}
