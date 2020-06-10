//
//  ManagersTableViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Ayesha on 27/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class ManagersTableViewCell:UITableViewCell{
    @IBOutlet weak var lblStationName: UILabel!
    @IBOutlet weak var lblStationLocation: UILabel!
    @IBOutlet weak var lblClusterManagerCount: UILabel!
    @IBOutlet weak var lblStationManagerCount: UILabel!
}

class ManagersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
           let cell = tableView.dequeueReusableCell(withIdentifier: "managersCellIdentifier", for: indexPath)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 0.5
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.masksToBounds = true
           return cell
       }
    
    
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
         let storyboard = UIStoryboard(name: "Managers", bundle: nil)
         let managersVC = storyboard.instantiateViewController(identifier: "ManagersDetailVC") as! ManagersDetailViewController
         let nav = UINavigationController(rootViewController: managersVC)
         nav.modalPresentationStyle = .fullScreen
         self.present(nav, animated: true, completion:nil)
           // navigationController?.pushViewController(nav, animated: true)
        
   }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 10
       }
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView()
           view.backgroundColor = UIColor.clear
           return view
       }

}
