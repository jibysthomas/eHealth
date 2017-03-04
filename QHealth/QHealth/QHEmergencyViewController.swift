//
//  QHEmergencyViewController.swift
//  QHealth
//
//  Created by Anand on 3/4/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class QHEmergencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Emergency"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension QHEmergencyViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
