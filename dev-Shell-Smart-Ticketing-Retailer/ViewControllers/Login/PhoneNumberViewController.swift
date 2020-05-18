//
//  PhoneNumberViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 12/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    
    @IBOutlet weak var btnGenerateOTP: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var lblPhoneNo: UILabel!
    
    
    fileprivate func configureView() {
        btnGenerateOTP.layer.cornerRadius = 10
        //        numberTextField.layer.cornerRadius = 10
        //        numberTextField.layer.borderWidth = 0.5
        numberTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        //lblPhoneNo.text = "New Phone No."
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        numberTextField.resignFirstResponder()
    }
    
}
