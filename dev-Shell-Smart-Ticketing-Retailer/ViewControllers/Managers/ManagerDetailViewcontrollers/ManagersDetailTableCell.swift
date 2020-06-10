//
//  ManagersDetailTableCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Ayesha on 10/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class ManagersDetailTableCell: UITableViewCell {
    @IBOutlet weak var managerImage: UIImageView!
    @IBOutlet weak var managerName: UILabel!
    
    @IBOutlet weak var managerPhoneNo: UILabel!
    
    @IBOutlet weak var btnCall: UIButton!
    @IBAction func rightArrowButton(_ sender: Any) {
       
    }
    @IBAction func infoButton(_ sender: Any) {
           }
    @IBAction func callButton(_ sender: Any) {
    }
    @IBOutlet weak var btnInfo: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         // Button Customization
         //circle button
         managerImage.layer.cornerRadius = managerImage.frame.width / 2 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
