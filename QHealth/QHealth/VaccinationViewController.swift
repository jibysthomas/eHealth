//
//  VaccinationViewController.swift
//  QHealth
//
//  Created by Hafiz Abdul Kareem on 3/4/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class VaccinationViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var tableView_: UITableView!
    let vaccineTableCellIdentifier = "VaccinationTableCell"
    
    class func instanceSelectDepartureFromNib() -> VaccinationViewController? {
        super.initialize()
        return UINib(nibName: "VaccinationViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? VaccinationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTable()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Register Table
    func registerTable(){
        self.tableView_.register(UINib(nibName: "VaccinationTableCell", bundle: nil), forCellReuseIdentifier: vaccineTableCellIdentifier)
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        let sectionNum:Int = 1
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNum:Int = 2
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell:VaccinationTableCell!
        cell = self.vaccineTableCell(indexPath, and: tableView)
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.4
        cell.backView.layer.shadowOffset = CGSize.zero
        cell.backView.layer.shadowRadius = 2
        return cell
    }
    
    func vaccineTableCell(_ indexPath:IndexPath, and tableView:UITableView) -> VaccinationTableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: vaccineTableCellIdentifier, for: indexPath) as! VaccinationTableCell
        return cell
    }
    
}
