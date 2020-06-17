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
        let spinner = UIActivityIndicatorView()
        spinner.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        self.view.addSubview(spinner)
        spinner.startAnimating()
        if let user = self.emailTextField.text {
            
            let url = URL(string: "http://3.7.238.93/api/auth/password")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let parameters: [String: Any] = [
             "Email":"\(user)"
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
                            let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardConstants.viewIds.EmailFVerificationViewController)as! EmailFVerificationViewController
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

