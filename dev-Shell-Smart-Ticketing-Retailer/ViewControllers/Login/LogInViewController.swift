//
//  LogInViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 12/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        phoneNoTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
    
    fileprivate func configureView() {
        btnLogIn.layer.cornerRadius = 10
        //        phoneNoTextField.layer.cornerRadius = 10
        //        phoneNoTextField.layer.borderWidth = 0.5
        //        phoneNoTextField.layer.borderColor = UIColor.gray.cgColor
        //        passwordTextField.layer.cornerRadius = 10
        //        passwordTextField.layer.borderWidth = 0.5
        //        passwordTextField.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func ForgetPasswordClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "OTPViewController") as! OTPViewController
        vc.shouldShowChangeBanner = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
