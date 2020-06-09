//
//  DefaultTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 07/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {


    @IBOutlet weak var btnChooseEquipment: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
