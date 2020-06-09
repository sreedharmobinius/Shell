//
//  EmailIdViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 12/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class EmailIdViewController: UIViewController {
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        emailTextField.resignFirstResponder()
        
    }
    fileprivate func configureView() {
        btnSubmit.layer.cornerRadius = 10        
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnSubmitClicked(_ sender: Any) {
    }
}

