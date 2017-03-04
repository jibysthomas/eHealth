//
//  SideMenuViewController.swift
//  QHealth
//
//  Created by Hafiz Abdul Kareem on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet var tableView_: UITableView!
    let MENU_ARRAY:NSArray = ["My Dashboard", "My Goal", "My Diary", "Settings", "Support", "Contact Us"]
    let MENU_DIC:NSDictionary = ["My Dashboard" : "dashBoard", "My Goal" : "goal", "My Diary" : "diary", "Settings" : "settings_menu", "Support" : "settings_menu", "Contact Us" : "settings_menu"]
    let menuTableCellIdentifier = "MenuTableViewCell"

    class func instanceSelectDepartureFromNib() -> SideMenuViewController? {
        super.initialize()
        return UINib(nibName: "SideMenuViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? SideMenuViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTable()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    //MARK: Register Table
    func registerTable(){
        self.tableView_.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: menuTableCellIdentifier)
    }
    
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        let sectionNum:Int = 1
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNum:Int = MENU_ARRAY.count
        return rowNum
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 0
        height = UITableViewAutomaticDimension
        return height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 0
        height = UITableViewAutomaticDimension
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = self.menuTableCell(indexPath, and: tableView)
        return cell
    }
    
    func menuTableCell(_ indexPath:IndexPath, and tableView:UITableView) -> MenuTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuTableCellIdentifier, for: indexPath) as! MenuTableViewCell
        cell.menuTitle.text = MENU_ARRAY.object(at: (indexPath as NSIndexPath).row) as? String
        cell.iconImageView.image = UIImage(named: MENU_DIC.value( forKey: (MENU_ARRAY.object(at: (indexPath as NSIndexPath).row) as? String)!)! as! String)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
