//
//  SelectDispensorCategoryTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class SelectDispensorCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imgDot: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func EditButtonClicked(_ sender: Any) {
    }
}
