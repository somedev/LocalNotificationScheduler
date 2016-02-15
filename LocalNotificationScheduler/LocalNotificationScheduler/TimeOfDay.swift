//
//  Created by Eduard Panasiuk on 1/4/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public struct TimeOfDay{
    static private let timeConstant:NSTimeInterval = 60
    static public  let oneDayTimeInterval:NSTimeInterval = 24 * timeConstant * timeConstant
    private var _timeInterval:NSTimeInterval = 0
    
    public var hour:Int {
        get {return Int(_timeInterval / (TimeOfDay.timeConstant * TimeOfDay.timeConstant))}
    }

    public var minute:Int {
        get {return Int((_timeInterval - NSTimeInterval(hour) * TimeOfDay.timeConstant * TimeOfDay.timeConstant) /  TimeOfDay.timeConstant)}
    }

    public var second:Int {
        get {return Int(_timeInterval - NSTimeInterval(hour) * TimeOfDay.timeConstant * TimeOfDay.timeConstant - NSTimeInterval(minute) * TimeOfDay.timeConstant)}
    }

    public var timeInterval:NSTimeInterval{
        get {return _timeInterval}
    }
    
    public init(hours:Int = 0, minutes:Int = 0, seconds:Int = 0){
        _timeInterval = 0
        _timeInterval += NSTimeInterval(hours) * TimeOfDay.timeConstant * TimeOfDay.timeConstant
        _timeInterval += NSTimeInterval(minutes) * TimeOfDay.timeConstant
        _timeInterval += NSTimeInterval(seconds)
    }

}