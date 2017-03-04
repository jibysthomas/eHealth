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

        self.title = "My Avtivity"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
        // Do any additional setup after loading the view.
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
        headerView.frame =  CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50)
        return headerView;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = rowsArray[indexPath.row] as? String
        
        return cell
    }
}
