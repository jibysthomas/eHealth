//
//  MenuTableViewCell.swift
//  MyWallet
//
//  Created by Hafiz Abdul Kareem on 9/11/16.
//  Copyright © 2016 Hafiz Abdul Kareem. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var menuTitle: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
