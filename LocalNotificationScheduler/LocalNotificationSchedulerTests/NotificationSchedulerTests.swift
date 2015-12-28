//
//  NotificationSchedulerTests.swift
//  NotificationSchedulerTests
//
//  Created by Eduard Panasiuk on 12/28/15.
//  Copyright © 2015 somedev. All rights reserved.
//

import XCTest
@testable import LocalNotificationScheduler

class NotificationSchedulerTests: XCTestCase {
    
    let scheduler:NotificationScheduler = NotificationScheduler.sharedInstance
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testSingleton() {
        let secondScheduler:NotificationScheduler? = NotificationScheduler.sharedInstance
        XCTAssertNotNil(secondScheduler)
        XCTAssertTrue(self.scheduler === secondScheduler, "Singleton instance should be the same object")
    }
    
}
