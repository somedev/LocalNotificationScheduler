//
//  Created by Eduard Panasiuk on 1/4/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public struct TimeOfDay{
    static private let timeConstant:TimeInterval = 60
    static public  let oneDayTimeInterval:TimeInterval = 24 * timeConstant * timeConstant
    private var _timeInterval:TimeInterval = 0
    
    public var hour:Int {
        get {return Int(_timeInterval / (TimeOfDay.timeConstant * TimeOfDay.timeConstant))}
    }

    public var minute:Int {
        get {return Int((_timeInterval - TimeInterval(hour) * TimeOfDay.timeConstant * TimeOfDay.timeConstant) /  TimeOfDay.timeConstant)}
    }

    public var second:Int {
        get {return Int(_timeInterval - TimeInterval(hour) * TimeOfDay.timeConstant * TimeOfDay.timeConstant - TimeInterval(minute) * TimeOfDay.timeConstant)}
    }

    public var timeInterval:TimeInterval{
        get {return _timeInterval}
    }
    
    public init(hours:Int = 0, minutes:Int = 0, seconds:Int = 0){
        _timeInterval = 0
        _timeInterval += TimeInterval(hours) * TimeOfDay.timeConstant * TimeOfDay.timeConstant
        _timeInterval += TimeInterval(minutes) * TimeOfDay.timeConstant
        _timeInterval += TimeInterval(seconds)
    }

}
