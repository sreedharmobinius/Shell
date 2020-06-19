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
    @IBOutlet weak var btnChangePhoneNO: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    var shouldShowChangeBanner = false
    var user : String?
    var flow :String?
    @IBOutlet weak var resendOTPButton: UIButton!
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    var timeRemaining = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        if (shouldShowChangeBanner){
            btnChangePhoneNO.isHidden = false
        }
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField1.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
        startTimer()
    }
    func startTimer(){
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(OTPViewController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        timeRemaining -= 1
        if (timeRemaining >= 0){
        let minutesLeft = Int(timeRemaining) / 60 % 60
        let secondsLeft = Int(timeRemaining) % 60
        countDownLabel.text = "\(minutesLeft):\(secondsLeft)"
        }
    }
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        
    }
    
    fileprivate func configureView() {
        btnSubmit.layer.cornerRadius = 10
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
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        
        if let otp1 = textField1.text, let otp2 = textField2.text, let otp3 = textField3.text, let otp4 = textField4.text, let user = self.user {
            self.showProgressHUD()// To show Loding indicator.
            let otpString = "\(otp1)\(otp2)\(otp3)\(otp4)"
            
            let parameters: String  = "?user=\(user)&otp=\(otpString)&changePhonenumber=false"
            
            OTPViewModel().verifyOTP(with: parameters, onCompletion: {(result) in
                switch result {
                case .success( _):
                    DispatchQueue.main.async {
                        if (self.flow == NSLocalizedString("CHANGE_PHONE_NO_FLOW", comment: "CHANGE_PHONE_NO_FLOW")){
                            self.dismissProgressHUD()// Stop loading Indicator.
                            let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.HomeStoryBoard, bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.HomeViewController)
                            self.navigationController?.pushViewController(controller, animated: true)
                        }else {
                            self.dismissProgressHUD()// Stop loading Indicator.
                            let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.LoginStoryBoard, bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.PassWordViewController)as! PassWordViewController
                            controller.titleString = NSLocalizedString("SET_PASSWORD", comment: "SET_PASSWORD")
                            controller.user = self.user
                            controller.flow = self.flow
                            self.navigationController?.pushViewController(controller, animated: true)

                        }
                    }
                    break;
                case .failure( _):

                    break;
                }
            })
        }
    }
    
    
    @IBAction func ChangePhoneNoClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.LoginStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.EmailIdViewController)as! EmailIdViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func resendOTPClicked(_ sender: Any) {
        countdownTimer.invalidate()
        timeRemaining = 120
        startTimer()
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
