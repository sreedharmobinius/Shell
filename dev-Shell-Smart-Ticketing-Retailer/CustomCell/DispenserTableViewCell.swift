//
//  DispenserTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class DispenserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblDispenser: UILabel!
    @IBOutlet weak var lblWarranty: UILabel!
    
    @IBOutlet weak var lblMake: UILabel!
    
    @IBOutlet weak var lblModel: UILabel!
    
    @IBOutlet weak var btnViewFailureModes: UIButton!
    @IBOutlet weak var imgDot: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
