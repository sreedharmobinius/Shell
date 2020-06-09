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
        tableView.register(UINib(nibName: "SelectedEquipmentTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectedEquipmentTableViewCell")
        tableView.register(UINib(nibName: "DispenserTableViewCell", bundle: nil), forCellReuseIdentifier: "DispenserTableViewCell")
        tableView.register(UINib(nibName: "PreliminaryCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "PreliminaryCheckTableViewCell")
        tableView.register(UINib(nibName: "PhotoEvidenceTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoEvidenceTableViewCell")
        
        
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
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultTableViewCell
                customCell.btnChooseEquipment.isHidden = false
                customCell.btnChooseEquipment.layer.borderWidth = 0.5
                customCell.btnChooseEquipment.layer.cornerRadius = 8
                customCell.btnChooseEquipment.tag = indexPath.row
                customCell.btnChooseEquipment.addTarget(self, action: #selector(btnChooseEquipmentClicked(sender:)), for: .touchUpInside)
                cell = customCell
                break
            case 1:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                customCell.textLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
                customCell.textLabel?.text = "- - - - - - - -"
                cell = customCell
                break
            case 2:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                customCell.textLabel?.text = "- - - - - - - -"
                cell = customCell
                break
            case 3:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                customCell.textLabel?.text = "- - - - - - - -"
                cell = customCell
                break
            case 4:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "PhotoEvidenceTableViewCell", for: indexPath) as! PhotoEvidenceTableViewCell
                cell = customCell
                break
            default:
                break
                
            }
            
        }else {
            switch indexPath.section {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: "SelectedEquipmentTableViewCell", for: indexPath)as! SelectedEquipmentTableViewCell
                break
            case 1:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                customCell.textLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
                customCell.textLabel?.text = "Cross Mark"
                cell = customCell
                break
            case 2:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "PreliminaryCheckTableViewCell", for: indexPath) as! PreliminaryCheckTableViewCell
                cell = customCell
                break
            case 3:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                customCell.textLabel?.lineBreakMode = .byWordWrapping
                customCell.textLabel?.numberOfLines = 0
                customCell.textLabel?.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 194/255, alpha: 1)
                customCell.textLabel?.text = "MDU -1 Cross mark or What error in the Display in MDU and BPOS"
                cell = customCell
                break
            case 4:
                let  customCell = tableView.dequeueReusableCell(withIdentifier: "PhotoEvidenceTableViewCell", for: indexPath) as! PhotoEvidenceTableViewCell
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
        let viewHeader  = UINib(nibName: "WorkOrderDetailHeaderCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? WorkOrderDetailHeaderCell
        if (prevVC == nil ){
            viewHeader?.btnChange.isHidden = false
        }
        switch section {
        case 0:
            viewHeader?.lblHeader.text = "Equipment Details"
            break
        case 1:
            viewHeader?.lblHeader.text = "Potential Failure Mode"
            break
        case 2:
            viewHeader?.lblHeader.text = "Preliminary Checks"
            viewHeader?.dottedView.isHidden = false
            viewHeader?.redView.isHidden = false
            viewHeader?.dashView.isHidden = true
            break
        case 3:
            viewHeader?.lblHeader.text = "Complaint"
            viewHeader?.dottedView.isHidden = false
            viewHeader?.dashView.isHidden = true
            break
        case 4:
            viewHeader?.lblHeader.text = "Photo Evidence"
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
        let storyboard = UIStoryboard(name: "NewWorkOrder", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "newView")
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func CloseButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func MinimiseButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeTabBarViewController
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
