//
//  SideMenuViewController.swift
//  QHealth
//
//  Created by Hafiz Abdul Kareem on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController{
    
    class func instanceSelectDepartureFromNib() -> SideMenuViewController? {
        super.initialize()
        return UINib(nibName: "SideMenuViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? SideMenuViewController
    }

}
