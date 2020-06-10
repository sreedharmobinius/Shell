//
//  OTPViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 14/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lblPhoneNo: UILabel!
    @IBOutlet weak var lblDescp: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblChangeBanner: UILabel!
    var shouldShowChangeBanner = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        if (shouldShowChangeBanner){
            lblChangeBanner.isHidden = false
        }
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField1.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        
    }
    
    fileprivate func configureView() {
        btnSubmit.layer.cornerRadius = 10
        //        textField1.layer.borderWidth = 0.5
        //        textField1.layer.cornerRadius = 10
        //        textField1.layer.borderColor = UIColor.gray.cgColor
        //        textField2.layer.borderWidth = 0.5
        //        textField2.layer.cornerRadius = 10
        //        textField2.layer.borderColor = UIColor.gray.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text!.count < 1) && (string.count > 0)){
            if (textField == textField1){
                textField2.becomeFirstResponder()
            }
            if (textField == textField2){
                textField3.becomeFirstResponder()
            }
            if (textField == textField3){
                textField4.becomeFirstResponder()
            }
            if (textField == textField4){
                textField4.resignFirstResponder()
            }
            textField.text = string
            return false
        } else if((textField.text!.count >= 1) && (string.count == 0)){
            if textField == textField2{
                textField1.becomeFirstResponder()
            }
            if textField == textField3{
                textField2.becomeFirstResponder()
            }
            if textField == textField4{
                textField3.becomeFirstResponder()
            }
            if textField == textField1{
                textField1.resignFirstResponder()
            }
            textField.text = ""
            return false
        }else if (textField.text!.count >= 1){
            textField.text = string
            return false
        }
        return true
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension UITextField
{
    open override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.masksToBounds = true
    }
}
