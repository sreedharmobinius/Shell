//
//  ManagerModelClass.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Ayesha on 10/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class ManagerModelClass: NSObject {
    var managerPhoto: String?
    var managerName:String?
    var managerNumber:String?
    
    init(managerPhoto:String, managerName:String, managerNumber:String){
        self.managerPhoto = managerPhoto
        self.managerName = managerName
        self.managerNumber = managerNumber
    }
}
