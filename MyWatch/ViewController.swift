//
//  ViewController.swift
//  MyWatch
//
//  Created by apple2 on 16/1/6.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

import UIKit
import Foundation
import ModelFramework

class ViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        let navi = weatherViewControllerForDay(.Today)
        setViewControllers([navi], direction: .Forward, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    我们希望能为每一天的天气显示一个 title，一个比较理想的做法就是直接将我们的 WeatherViewController 嵌套在 navigation controller 里，这样我们就可以直接使用 navigation bar 来显示标题，而不用去操心它的布局了。
    */
    func weatherViewControllerForDay(day:Day)->UIViewController{
        let weatherVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WeatherViewController") as! WeatherViewController
        weatherVC.day = day
        let navi = UINavigationController.init(rootViewController: weatherVC)
        return navi
    }
    
}

//用拓展来分离出数据源方法
extension ViewController: UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        //取出日子
        guard let navi = viewController as? UINavigationController,
            root = navi.viewControllers.first as? WeatherViewController,
            day = root.day
        else{
            return nil
        }
        
        if day == .DayAfterTomorrow{
            return nil
        }
        
        //返回后一天
        guard let laterDay = Day.init(rawValue: day.rawValue + 1) else{
            return nil
        }
        
        return weatherViewControllerForDay(laterDay)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let navi = viewController as? UINavigationController,
            root = navi.viewControllers.first as? WeatherViewController,
            day = root.day
            else{
                return nil
        }
        
        if day == .DayBeforeYesterday{
            return nil
        }

        guard let earlierDay = Day.init(rawValue: day.rawValue - 1)
            else{
                return nil
        }
        
        return weatherViewControllerForDay(earlierDay)
        
    }
}

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    var day: Day?{
        didSet{
            //根据成员day下title属性的变化来自动更新自己的标题
            title = day?.title
        }
    }
}











