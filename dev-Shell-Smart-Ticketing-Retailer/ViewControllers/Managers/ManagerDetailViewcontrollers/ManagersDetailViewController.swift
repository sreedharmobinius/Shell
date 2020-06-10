//
//  ManagersDetailViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Ayesha on 03/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit
class ManagersDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    var model = [ManagerModelClass]()
    

     override func viewDidLoad() {
           super.viewDidLoad()
           self.navigationController?.isNavigationBarHidden = true
           segmentControlAppearance()
        let object = ManagerModelClass(managerPhoto:"", managerName:"Shiva Kumar", managerNumber: "9000987665")
        model.append(object)
       let object1 = ManagerModelClass(managerPhoto:"", managerName:"Narasimha Swamy Reddy", managerNumber: "9000987665")
        model.append(object1)
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.navigationController?.isNavigationBarHidden = true
           segmentControlAppearance()
           
       }
    
    func segmentControlAppearance(){
        // if #available(iOS 13.0, *) {
          segmentControl.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
               segmentControl.layer.borderColor = UIColor.white.cgColor
              segmentControl.selectedSegmentTintColor = UIColor(red: 225/255, green: 24/255, blue: 20/255, alpha: 1)
               segmentControl.layer.borderWidth = 1
    
               let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)]
               segmentControl.setTitleTextAttributes(titleTextAttributes, for:.normal)

               let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)]
               segmentControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
               //} else {
                       // Fallback on earlier versions
               // }
    }
    //MARK:- Tableview Datasource Methods
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
       
       }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "managersCell") as! ManagersDetailTableCell
       // cell.managerImage.image =
        cell.managerName.text = model[indexPath.row].managerName
        cell.managerPhoneNo.text = model[indexPath.row].managerNumber
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           

       }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
}

/*extension ManagersDetailViewController:  UITableViewDelegate, UITableViewDataSource{

    //MARK:- Tableview Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
   }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: "managersCell", for: indexPath) //as! ManagersDetailTableCell
    return cell
}
}
*/
