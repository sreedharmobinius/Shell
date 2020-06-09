//
//  PreliminaryCheckTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 06/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class PreliminaryCheckTableViewCell: UITableViewCell {

    var unchecked = true
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func yesButtonClicked(_ sender: Any) {
        if unchecked {
            
            unchecked = false
        }
        else {
            
            unchecked = true
        }
    }
    
    @IBAction func noButtonClicked(_ sender: Any) {
        if unchecked {
           
            unchecked = false
        }
        else {
            
            unchecked = true
        }
    }
}
