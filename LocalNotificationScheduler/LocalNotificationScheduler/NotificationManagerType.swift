//
// Created by Eduard Panasiuk on 12/30/15.
// Copyright (c) 2015 somedev. All rights reserved.
//

import UIKit

public protocol NotificationManagerType {
    func scheduleLocalNotification(notification: UILocalNotification)
    func cancelLocalNotification(notification: UILocalNotification)
    func cancelAllLocalNotifications()
    var  scheduledLocalNotifications: [UILocalNotification]? {get}
}

extension UIApplication : NotificationManagerType {}