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
    
    func scheduleLocalNotification(_ notification: UILocalNotification){
        self.wrapOnMainThread { () -> () in
            self.notifications.append(notification)
        }
    }
    
    func cancelLocalNotification(_ notification: UILocalNotification){
        self.wrapOnMainThread { () -> () in
            if let index = self.notifications.index(of: notification) {
                self.notifications.remove(at: index)
            }
        }
    }
    
    func cancelAllLocalNotifications(){
        self.wrapOnMainThread { () -> () in
            self.notifications.removeAll()
        }
    }
    
    private func wrapOnMainThread(_ action:() -> ()) -> (){
        if(Thread.isMainThread()){
            action()
        } else {
            DispatchQueue.main.sync(execute: { () -> Void in
                action()
            })
        }
    }
    
}
