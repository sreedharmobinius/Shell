//
//  PassWordViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 12/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class PassWordViewController: UIViewController {
    
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblDescp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //lblTitle.text = "New Password"
        //lblDescp.text = "Enter New Password and Re confirm the same Password"
        configureView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        newPasswordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        
    }
    
    
    fileprivate func configureView() {
        btnDone.layer.cornerRadius = 10
    }
    
    
    @IBAction func backButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
