//
// Created by Eduard Panasiuk on 12/30/15.
// Copyright © 2015 somedev. All rights reserved.
//

import UIKit
import LocalNotificationScheduler

class NotificationManagerTypeMock: NotificationManagerType {
    private var notifications : [UILocalNotification] = [];
    
    var  scheduledLocalNotifications: [UILocalNotification]? {get{
        return notifications
        }}
    
    func scheduleLocalNotification(notification: UILocalNotification){
        self.wrapOnMainThread { () -> () in
            self.notifications.append(notification)
        }
    }
    
    func cancelLocalNotification(notification: UILocalNotification){
        self.wrapOnMainThread { () -> () in
            if let index = self.notifications.indexOf(notification) {
                self.notifications.removeAtIndex(index)
            }
        }
    }
    
    func cancelAllLocalNotifications(){
        self.wrapOnMainThread { () -> () in
            self.notifications.removeAll()
        }
    }
    
    private func wrapOnMainThread(action:() -> ()) -> (){
        if(NSThread.isMainThread()){
            action()
        } else {
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                action()
            })
        }
    }
    
}