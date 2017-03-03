//
//  AimDetailViewController.swift
//  QHealth
//
//  Created by sree on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit
import SMSwipeableTabView

class AimDetailViewController: UIViewController, SMSwipeableTabViewControllerDelegate {
    enum AimsType:String {
        case WeightGain = "Weight Gain", WeightLoss = "Weight Loss", Diabetes = "Diabetes"
    }
    var aimType:AimsType = AimsType.WeightGain
    
    let titleBarDataSource = ["Food", "Workout", "Sleep", "Social"]
    
    let swipeableView = SMSwipeableTabViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = aimType.rawValue
        
        swipeableView.titleBarDataSource = titleBarDataSource
        swipeableView.delegate = self
        swipeableView.viewFrame = CGRect(x: 0.0, y: 64.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-64.0)
        
        swipeableView.segmentBarAttributes = [SMBackgroundColorAttribute : UIColor.white]
        swipeableView.selectionBarAttributes = [
            SMBackgroundColorAttribute : UIColor.green,
            SMAlphaAttribute : 0.8 as AnyObject
        ]
            swipeableView.buttonAttributes = [
                SMBackgroundColorAttribute : UIColor.clear,
                SMAlphaAttribute : 0.8 as AnyObject,
                SMFontAttribute : UIFont(name: "HelveticaNeue-Medium", size: 13.0)!,
                SMForegroundColorAttribute : UIColor.green
            ]
            swipeableView.selectionBarHeight = 3.0 //For thin line
            swipeableView.segementBarHeight = 50.0 //Default is 44.0
            swipeableView.buttonPadding = 10.0 //Default is 8.0
            swipeableView.buttonWidth = 80.0
        
        self.addChildViewController(swipeableView)
        self.view.addSubview(swipeableView.view)
        swipeableView.didMove(toParentViewController: self)
        
    }
    
    func didLoadViewControllerAtIndex(_ index: Int) -> UIViewController {
        switch index {
        case 0:
            let vc = FoodViewController()
            return vc
        case 1:
            let vc = WorkOutViewController()
            return vc
        case 2:
            let vc = SleepViewController()
            return vc
        case 3:
            let vc = SocialViewController()
            return vc
        default:
            let vc = FoodViewController()
            return vc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
