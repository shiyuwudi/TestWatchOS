//
//  Day.swift
//  MyWatch
//
//  Created by apple2 on 16/1/7.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import Foundation

public enum Day: Int {
    case DayBeforeYesterday = -2
    case Yesterday
    case Today
    case Tomorrow
    case DayAfterTomorrow
    
    //翻译
    public var title: String {
        let translation: String
        switch self{
        case .DayBeforeYesterday: translation = "前天"
        case .Yesterday: translation = "昨天"
        case .Today: translation = "今天"
        case .Tomorrow: translation = "明天"
        case .DayAfterTomorrow: translation = "后天"
        }
        return translation
    }
}

