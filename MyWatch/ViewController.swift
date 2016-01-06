//
//  ViewController.swift
//  MyWatch
//
//  Created by apple2 on 16/1/6.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class WeatherViewController: UIViewController {
    
    enum Day: Int {
        case DayBeforeYesterday = -2
        case Yesterday
        case Today
        case Tomorrow
        case DayAfterTomorrow
    }
    
    var day: Day?
}