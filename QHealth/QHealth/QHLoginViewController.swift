//
//  QHLoginViewController.swift
//  QHealth
//
//  Created by Anand on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class QHLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        let agreeBool: Bool = CacheManager.getValueForKey(plistItem: "agreeBool", plistName: SETTINGS_PLIST as NSString) as! Bool
        
        if agreeBool == false {
            let agreeController:UserAgreeViewController = UserAgreeViewController(nibName: "UserAgreeViewController", bundle: nil)
            self.present(agreeController, animated: false, completion: nil)
        }else{
        }
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        self.navigationController?.navigationBar.isHidden = false
        let profileController = QHProfileViewController(nibName:"QHProfileViewController",bundle:nil)
        self.navigationController?.pushViewController(profileController, animated: true)
    }
}

extension QHLoginViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
}
