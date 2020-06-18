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
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let spinner = UIActivityIndicatorView()
        spinner.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        if (phoneNoTextField.text != "" && passwordTextField.text != ""){
        if let userName = phoneNoTextField.text, let password = passwordTextField.text{
        let url = URL(string: "http://3.7.238.93/api/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "user":"\(userName)",
            "password": "\(password)"
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
                       // if let data = data{
//                        guard let response = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
//                          print("Error: Couldn't decode data into car")
//                          return
//                        }
//                        }
                       // print(response.token)
                        //self.callGetStations()
                        DispatchQueue.main.async {
                            spinner.stopAnimating()
                            let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.HomeStoryBoard, bundle: nil)
                            let vc = storyboard.instantiateViewController(identifier: StoryBoardConstants.viewIds.HomeViewController)
                            self.navigationController?.pushViewController(vc, animated: true)
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
    func   callGetStations(){
        let url = URL(string: "http://3.7.238.93/api/station/2")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("x-access-token", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let unwrappedData = data else { return }
            do {
                let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
                print(str)
              if let httpResponse = response as? HTTPURLResponse {
              print(httpResponse.statusCode)
                if(httpResponse.statusCode == 200){
                   
                    DispatchQueue.main.async {
                        let vc = self.storyboard?.instantiateViewController(identifier: StoryBoardConstants.viewIds.HomeViewController) as! HomeViewController
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                
                }
            }
            } catch {
                print("json error: \(error)")
            }
        }
        task.resume()
    }
    
    @IBAction func ForgetPasswordClicked(_ sender: Any) {
        if let mobileNumber = phoneNoTextField.text {
            self.showProgressHUD()// To show Loding indicator.
            let parameters: [String: Any] = [
                "user":"\(mobileNumber)",
            ]
            LoginViewModel().forgotPassword(with: parameters, onCompletion: {(result)in
                switch result {
                case .success( _):
                    DispatchQueue.main.async {
                        self.dismissProgressHUD()// Stop loading Indicator.
                        let vc = self.storyboard?.instantiateViewController(identifier: StoryBoardConstants.viewIds.OTPViewController) as! OTPViewController
                        vc.shouldShowChangeBanner = true
                        vc.flow = "ForgetPassword"
                        vc.user = mobileNumber
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    break;
                case .failure( _):
                    break
                }
            })
        }
    }
    
    @IBAction func NewUserButtonClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: StoryBoardConstants.viewIds.PhoneNumberViewController) as! PhoneNumberViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
