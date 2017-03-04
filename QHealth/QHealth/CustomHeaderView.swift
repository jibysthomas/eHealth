//
//  CustomHeaderView.swift
//  QHealth
//
//  Created by sree on 3/4/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    
    class func addContactDetailSectionHeader() -> CustomHeaderView {
        return UINib(nibName: "CustomHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomHeaderView
    }
    override func updateConstraints() {
        super.updateConstraints()
        self.frame.size = CGSize(width: self.superview!.frame.size.width, height: 50)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
