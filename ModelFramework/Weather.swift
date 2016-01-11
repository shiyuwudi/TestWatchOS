//
//  Weather.swift
//  MyWatch
//
//  Created by apple2 on 16/1/11.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import Foundation

/*
{
"weathers": [
{"day": -2, "state": 0, "low_temp": 18, "high_temp": 25},
{"day": -1, "state": 2, "low_temp": 9, "high_temp": 14},
{"day": 0, "state": 1, "low_temp": 12, "high_temp": 16},
{"day": 1, "state": 3, "low_temp": 2, "high_temp": 6},
{"day": 2, "state": 0, "low_temp": 19, "high_temp": 28}
]
}
*/

public struct Weather {
    
    public enum State:Int {
        case Sunny,Cloudy,Rainy,Snowy
    }
    
    let state:State
    let day:Day
    let highTemperature:Int
    let lowTemperature:Int
    
    //Json(字典)转模型
    public init?(json:[String:AnyObject]){
        //取值
        guard let
            dayNumber = json["day"] as? Int,
            day = Day(rawValue: dayNumber),
            stateNumber = json["state"] as? Int,
            state = State(rawValue: stateNumber),
            lowTemperature = json["low_temp"] as? Int,
            highTemperature = json["high_temp"] as? Int
            else { return nil }
        //赋值
        self.day = day
        self.state = state
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        var name = "Jim"
        name.write("")
    }
    
}