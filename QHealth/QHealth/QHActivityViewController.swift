//
//  QHActivityViewController.swift
//  QHealth
//
//  Created by Anand on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class QHActivityViewController: UIViewController {
    
    let sectionsArray:NSArray = ["Breakfast", "Lunch", "Dinner", "Snacks", "Exercise"]
    let bfArray:NSArray = ["Milk 2", "Juice 1"]
    let lunchArray:NSArray = ["Green Salad", "Pasta", "Tomatoes", "Bread"]
    let dinnerArray:NSArray = ["Pasta", "Bread 2"]
    let snacksArray:NSArray = []
    let exerciseArray:NSArray = ["Pushups 40", "Walking 20 mins"]
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "My Activity"
        Utilities.addNavColor(navController: self.navigationController!)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension QHActivityViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var noOfRows = 0
        
        switch section {
        case 0:
            noOfRows = bfArray.count
        case 1:
            noOfRows = lunchArray.count
        case 2:
            noOfRows = dinnerArray.count
        case 3:
            noOfRows = snacksArray.count
        case 4:
            noOfRows = exerciseArray.count
        default:
            noOfRows = 0
        }
        return noOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:CustomHeaderView = CustomHeaderView.addContactDetailSectionHeader()
        headerView.headerLabel.text = sectionsArray[section] as? String
        return headerView;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        var array:NSArray = []
        switch indexPath.section {
        case 0:
            array = bfArray
        case 1:
            array = lunchArray
        case 2:
            array = dinnerArray
        case 3:
            array = snacksArray
        case 4:
            array = exerciseArray
        default:
            array = bfArray
        }
        cell.textLabel?.text = array[indexPath.row] as? String
        cell.detailTextLabel?.text = "2 cups"
        return cell
    }
}
