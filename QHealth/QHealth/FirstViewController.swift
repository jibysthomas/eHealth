//
//  FirstViewController.swift
//  QHealth
//
//  Created by Anand on 3/3/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let aimsArray:NSArray = ["Weight Gain", "Weight Loss", "Diabetes"]
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LabelCell")
        
        self.title = "Select Goal"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController:UITableViewDelegate, UITableViewDataSource {
    
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
        return aimsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = aimsArray[indexPath.row] as? String
        
        return cell
    }
    
}

