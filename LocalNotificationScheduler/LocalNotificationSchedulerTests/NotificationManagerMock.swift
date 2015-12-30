//
//  NotificationManagerMock.swift
//  LocalNotificationScheduler
//
//  Created by Eduard Panasiuk on 12/30/15.
//  Copyright © 2015 somedev. All rights reserved.
//

import UIKit
import LocalNotificationScheduler

class NotificationManagerMock: NotificationManager {
    private var notificationCounter : Int = 0;
    
    var  scheduledLocalNotifications: [UILocalNotification]? {get{
        var result:[UILocalNotification] = []
        for _ in 0..<self.notificationCounter {
            result.append(UILocalNotification())
        }
        return result
        }}
    
    func scheduleLocalNotification(notification: UILocalNotification){
        self.notificationCounter += 1
    }
    
    func cancelLocalNotification(notification: UILocalNotification){
        self.notificationCounter -= 1
        if(self.notificationCounter < 0){
            self.notificationCounter = 0
        }
    }
    
    func cancelAllLocalNotifications(){
        self.notificationCounter = 0
    }
    
}