//
//  WorkOrderDetailHeaderCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 06/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class WorkOrderDetailHeaderCell: UITableViewCell {

    @IBOutlet weak var lblHeader: UILabel!
    
    @IBOutlet weak var dottedView: UILabel!
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var dashView: UIView!
    
    @IBOutlet weak var btnChange: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
