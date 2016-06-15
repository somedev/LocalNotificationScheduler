//
// Created by Eduard Panasiuk on 12/28/15.
// Copyright (c) 2015 somedev. All rights reserved.
//

import Foundation

public typealias SceduleOneCallback = (notification:UILocalNotification) -> ()
public typealias SceduleManyCallback = (notifications:[UILocalNotification]) -> ()


public class LocalNotificationScheduler {
    
    //MARK: - constants
    
    //MARK: - properties
    public var notificationManager: NotificationManagerType
    
    //MARK: - initializer
    static let sharedInstance = LocalNotificationScheduler()
    private init() {
        self.notificationManager = UIApplication.shared()
    }
    
    //MARK: - public
    public func scheduleNotification(_ notification:UILocalNotification, callback:SceduleOneCallback? = nil) throws -> (){
        try self.scheduleNotifications([notification], callback: {(notifications) -> () in
            if let callback = callback, note = notifications.first {
                callback(notification:note)
            }
        })
    }
    
    public func scheduleNotifications(_ notifications:[UILocalNotification], callback:SceduleManyCallback? = nil) throws -> () {
        guard let count = self.notificationManager.scheduledLocalNotifications?.count
            where count + notifications.count <= UILocalNotification.maxNotificationsCount() else {
                throw SchedulerError.maxNotificationsCount
        }
        
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async { () -> Void in
            for notification in notifications {
                self.notificationManager.scheduleLocalNotification(notification)
            }
            if let callback = callback {
                callback(notifications:notifications)
            }
        }
    }
    
}
