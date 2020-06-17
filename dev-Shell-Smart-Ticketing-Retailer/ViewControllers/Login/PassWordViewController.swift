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
    
    var user : String?
     var titleString : String?
    var flow : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleString{
            self.lblTitle.text = title
        }
        
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
    
    @IBAction func DoneButtonClicked(_ sender: Any) {
        let spinner = UIActivityIndicatorView()
        spinner.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        if (newPasswordTextField.text != "" && confirmPasswordTextField.text != ""){
            
            if (newPasswordTextField.text == confirmPasswordTextField.text){
                print("same")
                if let newPassword = newPasswordTextField.text, let username = user {
                    
                    let url = URL(string: "http://3.7.238.93/api/auth/password")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    let parameters: [String: Any] = [
                        "user":"\(username)",
                        "password": "\(newPassword)",
                        "initial_login": false
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
                                    if (self.flow == "ForgetPassword"){
                                        DispatchQueue.main.async {
                                            spinner.stopAnimating()
                                            let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.LoginStoryBoard, bundle: nil)
                                            let vc = storyboard.instantiateViewController(identifier: StoryBoardConstants.viewIds.LogInViewController)
                                            self.navigationController?.pushViewController(vc, animated: true)
                                        }
                                    }else {
                                    DispatchQueue.main.async {
                                        spinner.stopAnimating()
                                        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.HomeStoryBoard, bundle: nil)
                                        let vc = storyboard.instantiateViewController(identifier: StoryBoardConstants.viewIds.HomeViewController)
                                        self.navigationController?.pushViewController(vc, animated: true)
                                    }
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
    }
    
}
