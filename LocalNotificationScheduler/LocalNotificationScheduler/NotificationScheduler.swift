//
// Created by Eduard Panasiuk on 12/28/15.
// Copyright (c) 2015 somedev. All rights reserved.
//

import Foundation

public typealias SceduleOneCallback = (notification:UILocalNotification) -> ()
public typealias SceduleManyCallback = (notifications:[UILocalNotification]) -> ()


public class NotificationScheduler {
    
    //MARK: - constants
    
    //MARK: - properties
    public var notificationManager:NotificationManager
    
    //MARK: - initializer
    static let sharedInstance = NotificationScheduler()
    private init() {
        self.notificationManager = UIApplication.sharedApplication()
    }
    
    //MARK: - public
    public func scheduleNotification(notification:UILocalNotification, callback:SceduleOneCallback? = nil) throws -> (){
        try self.scheduleNotifications([notification], callback: {(notifications) -> () in
            if let callback = callback, note = notifications.first {
                callback(notification:note)
            }
        })
    }
    
    public func scheduleNotifications(notifications:[UILocalNotification], callback:SceduleManyCallback? = nil) throws -> () {
        guard let count = self.notificationManager.scheduledLocalNotifications?.count
            where count + notifications.count <= UILocalNotification.maxNotificationsCount() else {
                throw SchedulerError.MaxNotificationsCount
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            for notification in notifications {
                self.notificationManager.scheduleLocalNotification(notification)
            }
            if let callback = callback {
                callback(notifications:notifications)
            }
        }
    }
    
}