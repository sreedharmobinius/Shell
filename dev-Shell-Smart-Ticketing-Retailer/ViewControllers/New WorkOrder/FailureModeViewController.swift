//
//  FailureModeViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 05/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class FailureModeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var failures = ["Dispenser in not On", "Cross Mark"]

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var btnSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.btnCancel.layer.cornerRadius = 8
        self.btnCancel.layer.borderWidth = 0.5
        self.btnSubmit.layer.cornerRadius = 8
        self.btnSubmit.layer.borderWidth = 0.5
        
        // Do any additional setup after loading the view.
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 2
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: StoryBoardConstants.cellIds.FailureTypeCell, for: indexPath)
        cell.imageView?.image = UIImage(named: "icon_Logo_Small")
        cell.textLabel?.text = failures[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Montserrat-Bold", size: 11)
         return cell
         
         
     }
    
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.NewWorkOrderStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.NewWorkOrderDetails) as! NewWorkOrderDetailsViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
}
