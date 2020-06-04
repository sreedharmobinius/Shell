//
//  HomeTabBarViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 22/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var prevVC: NewWorkOrderDetailViewController!
    var isMinimised : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if ((prevVC) != nil){
            prevVC.dismiss(animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if(viewController is NewWorkOrderViewController){
            
            let storyboard = UIStoryboard(name: "NewWorkOrder", bundle: nil)
            if(isMinimised){
                if let controller = storyboard.instantiateViewController(withIdentifier: "NewWorkOrderDetail") as? NewWorkOrderDetailViewController {
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true, completion: nil)
                }
                self.isMinimised = false
                return false
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
