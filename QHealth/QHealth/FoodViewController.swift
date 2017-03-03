//
//  FoodViewController.swift
//  QHealth
//
//  Created by sree on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    let foodArray:NSArray = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FoodCell")
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

extension FoodViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let aimDetailVC = AimDetailViewController()
            aimDetailVC.aimType = .WeightGain
            self.navigationController?.pushViewController(aimDetailVC, animated: true)
            break
        case 1:
            let aimDetailVC = AimDetailViewController()
            aimDetailVC.aimType = .WeightLoss
            self.navigationController?.pushViewController(aimDetailVC, animated: true)
            break
        case 2:
            let aimDetailVC = AimDetailViewController()
            aimDetailVC.aimType = .Diabetes
            self.navigationController?.pushViewController(aimDetailVC, animated: true)
            break
            
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = foodArray[indexPath.row] as? String
        
        return cell
    }
}
