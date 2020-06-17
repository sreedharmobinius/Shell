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
    var titleString : String?
    var flow : String?
    
    var userViewModel = UserViewModel()
    
    fileprivate func configureView() {
        btnGenerateOTP.layer.cornerRadius = 10
        //        numberTextField.layer.cornerRadius = 10
        //        numberTextField.layer.borderWidth = 0.5
        numberTextField.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        if let title = titleString{
            lblPhoneNo.text = title
        }
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard(_sender:)))
        self.view.addGestureRecognizer(tapGesture)
        /*userViewModel.reloadTableView = { [weak self] ()  in
            guard let `self` = self else {return}
            //Reload your tableview here
        }*/
    }
    
    
    @objc func dismissKeyBoard (_sender: UITapGestureRecognizer){
        numberTextField.resignFirstResponder()
    }
    
    @IBAction func GenerateOTPClicked(_ sender: Any) {
        
        let spinner = UIActivityIndicatorView()
        spinner.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        if let mobileNumber = numberTextField.text {
            
        let url = URL(string: "http://3.7.238.93/api/auth/otp")!
               var request = URLRequest(url: url)
               request.httpMethod = "POST"
               let parameters: [String: Any] = [
                "user":"manoj.v@mobinius.com",
               ]
               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
               request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
               let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                   guard let unwrappedData = data else { return }
                   do {
                       let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
                       print(str)
                    if let httpResponse = response as? HTTPURLResponse {
                     print(httpResponse.statusCode)
                        if(httpResponse.statusCode == 200){
                             DispatchQueue.main.async {
                                spinner.stopAnimating()
                            let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.LoginStoryBoard, bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.OTPViewController)as! OTPViewController
                                controller.user = "manoj.v@mobinius.com"
                                if let flow = self.flow{
                                controller.flow = flow
                                controller.shouldShowChangeBanner = false
                                }
                            self.navigationController?.pushViewController(controller, animated: true)
                        }
                        }
                    }
                   } catch {
                       print("json error: \(error)")
                   }
               }
               task.resume()
    }
    }
    
}
