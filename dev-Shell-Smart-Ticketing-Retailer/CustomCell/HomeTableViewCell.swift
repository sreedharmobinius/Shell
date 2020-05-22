//
//  HomeTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 19/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblStationName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblInProgressCount: UILabel!
    @IBOutlet weak var lblFeedBackCount: UILabel!
    @IBOutlet weak var lblClosedCount: UILabel!
    @IBOutlet weak var lblFeedBackBadge: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblFeedBackBadge.layer.cornerRadius = self.lblFeedBackBadge.frame.width/2
        self.lblFeedBackBadge.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
}
