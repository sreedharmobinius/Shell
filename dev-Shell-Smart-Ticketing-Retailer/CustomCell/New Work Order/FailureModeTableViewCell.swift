//
//  FailureModeTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 05/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class FailureModeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTick: UIImageView!
    
    @IBOutlet weak var lblFailureType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
