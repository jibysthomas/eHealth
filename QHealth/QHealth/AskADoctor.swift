//
//  AskADoctor.swift
//  QHealth
//
//  Created by Hafiz Abdul Kareem on 3/4/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class AskADoctor: UIViewController {

    @IBOutlet var textBackView_: UIView!
    @IBOutlet var scrollView_: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textBackView_.layer.cornerRadius = 5.0
        textBackView_.layer.borderWidth = 0.7
        textBackView_.layer.borderColor = UIColor.lightGray.cgColor
        
        scrollView_.contentSize = CGSize(width: 1000, height: 70)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
