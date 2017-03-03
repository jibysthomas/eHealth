//
//  MainViewController.swift
//  QHealth
//
//  Created by Anand on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let agreeBool: Bool = CacheManager.getValueForKey(plistItem: "agreeBool", plistName: SETTINGS_PLIST as NSString) as! Bool

        if agreeBool == false {
            self.tabBarController?.tabBar.isHidden = true
            let agreeController:UserAgreeViewController = UserAgreeViewController(nibName: "UserAgreeViewController", bundle: nil)
            self.present(agreeController, animated: false, completion: nil)
        }else{
            self.tabBarController?.tabBar.isHidden = false
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
