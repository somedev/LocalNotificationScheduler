//
// Created by Eduard Panasiuk on 12/28/15.
// Copyright (c) 2015 somedev. All rights reserved.
//

import Foundation

public class NotificationScheduler {
    
    //MARK: - constants
    public let maxNotificationsCount:Int = 64

    //MARK: - properties
    public var notificationManager:NotificationManager

    //MARK: - initializer
    static let sharedInstance = NotificationScheduler()
    private init() {
        self.notificationManager = UIApplication.sharedApplication()
    }
    
    //MARK: - public
    public func scheduleNotification(notification:UILocalNotification) throws -> () {
        let count = self.notificationManager.scheduledLocalNotifications?.count
        if let count = count{
            if(count >= self.maxNotificationsCount){
                throw SchedulerError.MaxNotificationsCount
            }
        }
        self.notificationManager.scheduleLocalNotification(notification)
    }



}