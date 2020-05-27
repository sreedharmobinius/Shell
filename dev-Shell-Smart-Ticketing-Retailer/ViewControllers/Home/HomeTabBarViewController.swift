//
//  HomeTabBarViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 22/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if(viewController is NewWorkOrderViewController){
            
            let storyboard = UIStoryboard(name: "NewWorkOrder", bundle: nil)
            if(false){
                
            }else {
                if let controller = storyboard.instantiateViewController(withIdentifier: "NewWorkOrder") as? NewWorkOrderViewController {
                    controller.modalPresentationStyle = .fullScreen
                    let nav = UINavigationController(rootViewController: controller)
                    self.present(nav, animated: true, completion: nil)
                }

                return false
        }
            }

            return true
        }

}
