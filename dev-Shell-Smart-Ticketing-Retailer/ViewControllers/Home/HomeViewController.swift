//
//  HomeViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 19/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate {
   
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStationCount: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchView: UIView!
    
    let cellReuseIdentifier = "cell"
    var loginResponse : LoginResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: StoryBoardConstants.nibs.HomeTableViewCell, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           1
       }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell:HomeTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! HomeTableViewCell

           cell.layer.borderWidth = 1
           cell.layer.borderColor = UIColor.lightGray.cgColor
           cell.layer.cornerRadius = 10
           cell.clipsToBounds = true
           return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingsActionSheet: UIAlertController = UIAlertController(title:nil, message:nil, preferredStyle:UIAlertController.Style.actionSheet)
        settingsActionSheet.view.tintColor = UIColor.black
        if let firstSubview = settingsActionSheet.view.subviews.first, let alertContentView = firstSubview.subviews.first {
            for view in alertContentView.subviews {
                view.backgroundColor = UIColor.systemYellow
            }
        }
        

        settingsActionSheet.addAction(UIAlertAction(title: NSLocalizedString("STATION_DETAILS", comment: "STATION_DETAILS"), style:UIAlertAction.Style.default, handler:{ action in
        }))
        settingsActionSheet.addAction(UIAlertAction(title: NSLocalizedString("CANCEL", comment: "CANCEL"), style:UIAlertAction.Style.cancel, handler:nil))
        present(settingsActionSheet, animated:true, completion:nil)
    }
    
   
    
    @IBAction func SearchButtonClicked(_ sender: Any) {
        self.searchView.isHidden = false
    }
    
    @IBAction func EmergencyButtonClicked(_ sender: Any) {
    }
    
    @IBAction func NotificationButtonClicked(_ sender: Any) {
    }
    
    @IBAction func SearchBarBackClicked(_ sender: Any) {
        self.searchView.isHidden = true
    }
}
