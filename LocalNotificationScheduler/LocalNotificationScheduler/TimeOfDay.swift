//
//  Created by Eduard Panasiuk on 1/4/16.
//  Copyright © 2016 somedev. All rights reserved.
//

import Foundation

public struct TimeOfDay{
    private let timeConstant:NSTimeInterval = 60
    
    private var _timeInterval:NSTimeInterval = 0
    
    public var hour:Int {
        get {return Int(_timeInterval / (timeConstant * timeConstant))}
    }

    public var minute:Int {
        get {return Int((_timeInterval - NSTimeInterval(hour) * timeConstant * timeConstant) /  timeConstant)}
    }

    public var second:Int {
        get {return Int(_timeInterval - NSTimeInterval(hour) * timeConstant * timeConstant - NSTimeInterval(minute) * timeConstant)}
    }

    public var timeInterval:NSTimeInterval{
        get {return _timeInterval}
    }
    
    public init(hours:Int = 0, minutes:Int = 0, seconds:Int = 0){
        _timeInterval = 0
        _timeInterval += NSTimeInterval(hours) * timeConstant * timeConstant
        _timeInterval += NSTimeInterval(minutes) * timeConstant
        _timeInterval += NSTimeInterval(seconds)
    }

}