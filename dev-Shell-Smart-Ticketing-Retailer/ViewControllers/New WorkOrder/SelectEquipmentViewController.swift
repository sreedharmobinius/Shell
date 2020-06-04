//
//  SelectEquipmentViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class SelectEquipmentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayHeader = [1,1,1,1,1] // 2 Array of header, change it as per your uses
    var headerView : UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = UIColor.blue.cgColor
        lineLayer.lineWidth = 2
        lineLayer.lineDashPattern = [4,4]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 30, y: 100),
                                CGPoint(x: 30, y: 300)])
        lineLayer.path = path
        self.view.layer.addSublayer(lineLayer)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SelectEquipmentLayout", bundle: nil), forCellReuseIdentifier: "SelectEquipmentLayout")
        tableView.register(UINib(nibName: "DispenserTableViewCell", bundle: nil), forCellReuseIdentifier: "DispenserTableViewCell")
        tableView.register(UINib(nibName: "SelectDispensorCategoryCell", bundle: nil), forCellReuseIdentifier: "SelectDispensorCategoryCell")
        tableView.register(UINib(nibName: "VehicleTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "VehicleTypeTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "SelectEquipmentLayout", for: indexPath)
            break
        case 1:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: "SelectDispensorCategoryCell", for: indexPath) as! SelectDispensorCategoryTableViewCell
            customCell.lblCategory.text = "Electrical"
            cell = customCell
            break
        case 2:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: "DispenserTableViewCell", for: indexPath) as! DispenserTableViewCell
            cell = customCell
            break
        case 3:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell", for: indexPath) as! VehicleTypeTableViewCell
            customCell.lblDescp.text = "Four Wheeler"
            cell = customCell
            break
        case 4:
            if(indexPath.row == 0){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DispenserTableViewCell", for: indexPath) as! DispenserTableViewCell
                customCell.lblDispenser.text = "Dispensor Power Supply"
                customCell.btnViewFailureModes.isHidden = true
                cell = customCell
            }else if(indexPath.row == 1){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell", for: indexPath) as! VehicleTypeTableViewCell
                customCell.lblDescp.text = "Fueling Point 1"
                cell = customCell
                
            }
            
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "SelectDispensorCategoryCell", for: indexPath)
            break
            
        }
        
        return cell
    }
    
    var isIntial = true
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
             headerView  = UINib(nibName: "SelectedAreaView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? SelectedAreaView
             let indexSet: IndexSet = [indexPath.section]
             isIntial = false
             self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 1:
            headerView = tableView.cellForRow(at: indexPath)
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 2:
            headerView = tableView.cellForRow(at: indexPath)
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 3:
            headerView = tableView.cellForRow(at: indexPath)
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 4:
            headerView = tableView.cellForRow(at: indexPath)
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
            
        default:
            headerView = tableView.cellForRow(at: indexPath)
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader  = UINib(nibName: "TableViewHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? TableViewHeader
        if (isIntial){
            viewHeader?.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            switch section {
            case 0:
                viewHeader?.lblSelect.text = "Select Area"
                break
            case 1:
                viewHeader?.lblSelect.text = "Select Category"
                break
            default:
                viewHeader?.lblSelect.text = "Select"
                
            }
            let button = UIButton(type: .custom)
            button.frame = viewHeader!.bounds
            button.tag = section // Assign section tag to this button
            button.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
            viewHeader?.addSubview(button)
            return viewHeader
        }else {
            isIntial = true
            return headerView
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 1
        switch section {
        case 0:
            rowCount = 1
            break
        case 1:
            rowCount = 2
            break
        case 2:
            rowCount = 2
            break
        case 3:
            rowCount = 1
            break
        case 4:
            rowCount = 2
            break
            
        default:
            break
        }
        return (self.arrayHeader[section] == 0) ? 0 : rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayHeader.count
    }
    
    
    
    @objc func tapSection(sender: UIButton) {
        self.arrayHeader[sender.tag] = (self.arrayHeader[sender.tag] == 0) ? 1 : 0
        self.tableView.reloadSections([sender.tag], with: .fade)
    }
    @IBAction func BackButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

