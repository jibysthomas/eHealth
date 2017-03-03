//
//  UserAgreeViewController.swift
//  QHealth
//
//  Created by Hafiz Abdul Kareem on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class UserAgreeViewController: UIViewController {

    class func instanceFromNib() -> UserAgreeViewController? {
        super.initialize()
        return UINib(nibName: "UserAgreeViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UserAgreeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
