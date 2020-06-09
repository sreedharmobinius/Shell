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
    var arrayHeader = [1,1,1,1,1]
    var headerView : UITableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = UIColor.blue.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineDashPattern = [4,4]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 27, y: 100),
                                CGPoint(x: 27, y: 500)])
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
        tableView.register(UINib(nibName: "SelectedAreaView", bundle: nil), forCellReuseIdentifier: "SelectedAreaView")
        
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
            customCell.imgDot.isHidden = true
            cell = customCell
            break
        case 2:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: "DispenserTableViewCell", for: indexPath) as! DispenserTableViewCell
            customCell.imgDot.isHidden = true
            customCell.btnViewFailureModes.isHidden = true
            customCell.btnViewFailureModes.addTarget(self, action: #selector(btnViewFailureModesClicked(sender:)), for: .touchUpInside)
            cell = customCell
            break
        case 3:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell", for: indexPath) as! VehicleTypeTableViewCell
            customCell.lblDescp.text = "Four Wheeler"
            customCell.imgDot.isHidden = true
            cell = customCell
            break
        case 4:
            if(indexPath.row == 0){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DispenserTableViewCell", for: indexPath) as! DispenserTableViewCell
                customCell.lblDispenser.text = "Dispensor Power Supply"
                customCell.btnViewFailureModes.isHidden = true
                customCell.imgDot.isHidden = true
                cell = customCell
            }else if(indexPath.row == 1){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "VehicleTypeTableViewCell", for: indexPath) as! VehicleTypeTableViewCell
                customCell.lblDescp.text = "Fueling Point 1"
                customCell.imgDot.isHidden = true
                cell = customCell
            }
            
        default:
            break
            
        }
        
        return cell
    }
    
    var isIntial = true
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let SelectedView = tableView.dequeueReusableCell(withIdentifier: "SelectedAreaView", for: indexPath) as!  SelectedAreaView
            SelectedView.lblSelectedArea.text = "Dispenser"
            headerView = SelectedView
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.arrayHeader[indexPath.section] = (self.arrayHeader[indexPath.section] == 0) ? 1 : 0
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 1:
            let SelectedView = tableView.cellForRow(at: indexPath) as! SelectDispensorCategoryTableViewCell
            SelectedView.imgDot.isHidden = false
            SelectedView.btnEdit.isHidden = false
            headerView = SelectedView
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.arrayHeader[indexPath.section] = (self.arrayHeader[indexPath.section] == 0) ? 1 : 0
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 2:
            let SelectedView = tableView.cellForRow(at: indexPath)  as! DispenserTableViewCell
            SelectedView.imgDot.isHidden = false
            SelectedView.btnEdit.isHidden = false
            SelectedView.btnViewFailureModes.isHidden = false
            headerView = SelectedView
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.arrayHeader[indexPath.section] = (self.arrayHeader[indexPath.section] == 0) ? 1 : 0
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 3:
            let SelectedView = tableView.cellForRow(at: indexPath)  as! VehicleTypeTableViewCell
            SelectedView.imgDot.isHidden = false
            SelectedView.btnEdit.isHidden = false
            headerView = SelectedView
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.arrayHeader[indexPath.section] = (self.arrayHeader[indexPath.section] == 0) ? 1 : 0
            self.tableView.reloadSections(indexSet, with: .automatic)
            break
        case 4:
            if (indexPath.row == 0){
                let SelectedView = tableView.cellForRow(at: indexPath) as! DispenserTableViewCell
                SelectedView.imgDot.isHidden = false
                SelectedView.btnEdit.isHidden = false
                headerView = SelectedView
            }else if(indexPath.row == 1){
                let SelectedView = tableView.cellForRow(at: indexPath) as! VehicleTypeTableViewCell
                SelectedView.imgDot.isHidden = false
                SelectedView.btnEdit.isHidden = false
                headerView = SelectedView
            }
            let indexSet: IndexSet = [indexPath.section]
            isIntial = false
            self.arrayHeader[indexPath.section] = (self.arrayHeader[indexPath.section] == 0) ? 1 : 0
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
            //button.addTarget(self, action: #selector(tapSection(sender:)), for: .touchUpInside)
            viewHeader?.addSubview(button)
            return viewHeader
        }else {
            isIntial = true
            headerView?.contentView.layer.borderWidth = 0.5
            headerView?.contentView.layer.borderColor = UIColor.lightGray.cgColor
            return headerView?.contentView
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 247, green: 247, blue: 247, alpha: 1)
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayHeader.count
    }
    
    @objc func btnViewFailureModesClicked(sender: UIButton){
        let storyboard = UIStoryboard(name: "NewWorkOrder", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FailureModeViewController")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func tapSection(sender: UIButton) {
        self.arrayHeader[sender.tag] = (self.arrayHeader[sender.tag] == 0) ? 1 : 0
        self.tableView.reloadSections([sender.tag], with: .fade)
    }
    @IBAction func BackButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

