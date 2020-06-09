//
//  NewWorkOrderDetailsViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 07/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class NewWorkOrderDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    var imageArray: [UIImage] = []
    var prevVC: NewWorkOrderViewController!
    let defaultCellIdentifier = "DefaultCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        if ((prevVC) != nil){
            prevVC.dismiss(animated: true, completion: nil)
        }
        configureButtons()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.SelectedEquipmentTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.SelectedEquipmentTableViewCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.DispenserTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.DispenserTableViewCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.PreliminaryCheckTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.PreliminaryCheckTableViewCell)
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.PhotoEvidenceTableViewCell, bundle: nil), forCellReuseIdentifier: StoryBoardConstants.cellIds.PhotoEvidenceTableViewCell)
        
        
    }
    
    func configureButtons(){
        btnSubmit.layer.cornerRadius = 8
        btnSubmit.layer.borderWidth = 0.5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 1
        switch section {
        case 2:
            if (prevVC == nil ){
            rowCount = 5
            } else {
                rowCount = 1
            }
            break
        default:
            rowCount = 1
            break
        }
        return  rowCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        
        if (prevVC != nil ){
            
            switch indexPath.section {
            case 0:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath) as! DefaultTableViewCell
                customCell.btnChooseEquipment.isHidden = false
                customCell.btnChooseEquipment.layer.borderWidth = 0.5
                customCell.btnChooseEquipment.layer.cornerRadius = 8
                customCell.btnChooseEquipment.tag = indexPath.row
                customCell.btnChooseEquipment.addTarget(self, action: #selector(btnChooseEquipmentClicked(sender:)), for: .touchUpInside)
                cell = customCell
                break
            case 1:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
                customCell.textLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
                customCell.textLabel?.text = NSLocalizedString("PLACE_HOLDER_DASH", comment: "PLACE_HOLDER_DASH")
                cell = customCell
                break
            case 2:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
                customCell.textLabel?.text = NSLocalizedString("PLACE_HOLDER_DASH", comment: "PLACE_HOLDER_DASH")
                cell = customCell
                break
            case 3:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
                customCell.textLabel?.text = NSLocalizedString("PLACE_HOLDER_DASH", comment: "PLACE_HOLDER_DASH")
                cell = customCell
                break
            case 4:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.PhotoEvidenceTableViewCell, for: indexPath) as! PhotoEvidenceTableViewCell
                cell = customCell
                break
            default:
                break
                
            }
            
        }else {
            switch indexPath.section {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.SelectedEquipmentTableViewCell, for: indexPath)as! SelectedEquipmentTableViewCell
                break
            case 1:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
                customCell.textLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
                customCell.textLabel?.text = NSLocalizedString("CROSS_MARK", comment: "CROSS_MARK")
                cell = customCell
                break
            case 2:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.PreliminaryCheckTableViewCell, for: indexPath) as! PreliminaryCheckTableViewCell
                cell = customCell
                break
            case 3:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
                customCell.textLabel?.lineBreakMode = .byWordWrapping
                customCell.textLabel?.numberOfLines = 0
                customCell.textLabel?.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 194/255, alpha: 1)
                customCell.textLabel?.text = NSLocalizedString("MDU_ERROR_MESSAGE", comment: "MDU_ERROR_MESSAGE")
                cell = customCell
                break
            case 4:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.PhotoEvidenceTableViewCell, for: indexPath) as! PhotoEvidenceTableViewCell
                cell = customCell
                break
            default:
                break
                
            }
        }
    return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader  = UINib(nibName: StoryBoardConstants.nibs.WorkOrderDetailHeaderCell, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? WorkOrderDetailHeaderCell
        if (prevVC == nil ){
            viewHeader?.btnChange.isHidden = false
        }
        switch section {
        case 0:
            viewHeader?.lblHeader.text = NSLocalizedString("EQUIPMENT_DETAILS", comment: "EQUIPMENT_DETAILS")
            break
        case 1:
            viewHeader?.lblHeader.text = NSLocalizedString("POTENTIAL_FAILURE_MODE", comment: "POTENTIAL_FAILURE_MODE")
            break
        case 2:
            viewHeader?.lblHeader.text = NSLocalizedString("PRELIMINARY_CHECK", comment: "PRELIMINARY_CHECK")
            viewHeader?.dottedView.isHidden = false
            viewHeader?.redView.isHidden = false
            viewHeader?.dashView.isHidden = true
            break
        case 3:
            viewHeader?.lblHeader.text = NSLocalizedString("COMPLAINTS", comment: "COMPLAINTS")
            viewHeader?.dottedView.isHidden = false
            viewHeader?.dashView.isHidden = true
            break
        case 4:
            viewHeader?.lblHeader.text = NSLocalizedString("PHOTO_EVIDENCE", comment: "PHOTO_EVIDENCE" )
            break
        default:
            break
        }
        
        return viewHeader
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func btnChooseEquipmentClicked(sender: UIButton){
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.NewWorkOrderStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.DrillDownView)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func CloseButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func MinimiseButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.HomeStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.Home) as! HomeTabBarViewController
        controller.modalPresentationStyle = .fullScreen
        controller.prevVC = self
        controller.isMinimised = true
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(controller, animated: true, completion: nil)
    }
    
}
