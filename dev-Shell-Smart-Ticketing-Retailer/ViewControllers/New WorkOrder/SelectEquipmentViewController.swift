//
//  SelectEquipmentViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

struct Dispenser:Codable{
    var layout : String?
    var columnCount:Int?
    var rowCount:Int?
}

class SelectEquipmentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var dispenserCollection:[Dispenser]?

    @IBOutlet weak var tableView: UITableView!
    var arrayHeader = [1,1,1,1,1]
    var headerView : UITableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.SelectEquipmentLayout, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.SelectEquipmentLayout)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.DispenserTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.DispenserTableViewCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.SelectDispensorCategoryCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.SelectDispensorCategoryCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.VehicleTypeTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.VehicleTypeTableViewCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.SelectedAreaView, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.SelectedAreaView)
        dispenserCollection = parseConfig()
       
    }
    
    
    func parseConfig() -> [Dispenser] {
        let url = Bundle.main.url(forResource: "Config", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode([Dispenser].self, from: data)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        switch indexPath.section {
        case 0:
          let   customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.SelectEquipmentLayout, for: indexPath) as! SelectEquipmentLayoutTableViewCell
            if dispenserCollection?.first?.layout == "horizontal"{
    customCell.drawDispenserForHorizontalLayout(rowCount:(dispenserCollection?.first!.rowCount)!,columnCount:(dispenserCollection?.first!.columnCount)!)
            }
            else{
    customCell.drawDispenserForVerticalLayout(rowCount:(dispenserCollection?.first!.rowCount)!,columnCount:(dispenserCollection?.first!.columnCount)!)
            }
          cell = customCell
            break
        case 1:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.SelectDispensorCategoryCell, for: indexPath) as! SelectDispensorCategoryTableViewCell
            customCell.lblCategory.text = NSLocalizedString("ELECTRICAL", comment: "ELECTRICAL")
            customCell.imgDot.isHidden = true
            cell = customCell
            break
        case 2:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.DispenserTableViewCell, for: indexPath) as! DispenserTableViewCell
            customCell.imgDot.isHidden = true
            customCell.btnViewFailureModes.isHidden = true
            customCell.btnViewFailureModes.addTarget(self, action: #selector(btnViewFailureModesClicked(sender:)), for: .touchUpInside)
            cell = customCell
            break
        case 3:
            let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.VehicleTypeTableViewCell, for: indexPath) as! VehicleTypeTableViewCell
            customCell.lblDescp.text = NSLocalizedString("FOUR_WHEELER", comment: "FOUR_WHEELER")
            customCell.imgDot.isHidden = true
            cell = customCell
            break
        case 4:
            if(indexPath.row == 0){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.DispenserTableViewCell, for: indexPath) as! DispenserTableViewCell
                customCell.lblDispenser.text = NSLocalizedString("DISPENSORY_POWER_SUPPLY", comment: "DISPENSORY_POWER_SUPPLY")
                customCell.btnViewFailureModes.isHidden = true
                customCell.imgDot.isHidden = true
                cell = customCell
            }else if(indexPath.row == 1){
                let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.VehicleTypeTableViewCell, for: indexPath) as! VehicleTypeTableViewCell
                customCell.lblDescp.text = NSLocalizedString("FUELING_POINT1", comment: "FUELING_POINT1")
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
            let SelectedView = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.SelectedAreaView, for: indexPath) as!  SelectedAreaView
            SelectedView.lblSelectedArea.text = NSLocalizedString("DISPENSER", comment: "DISPENSER")
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
        let viewHeader  = UINib(nibName: StoryBoardConstants.nibs.TableViewHeader, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? TableViewHeader
        if (isIntial){
            viewHeader?.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            switch section {
            case 0:
                viewHeader?.lblSelect.text = NSLocalizedString("SELECT_AREA", comment: "SELECT_AREA")
                break
            case 1:
                viewHeader?.lblSelect.text = NSLocalizedString("SELECT_CATEGORY", comment: "SELECT_CATEGORY")
                break
            default:
                viewHeader?.lblSelect.text = NSLocalizedString("SELECT", comment: "SELECT")
                
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
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.NewWorkOrderStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.FailureModeViewController)
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

