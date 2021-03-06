//
//  NewWorkOrderViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 22/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class NewWorkOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var containerView: UIView!
    let cellReuseIdentifier = "NewWorkOrderCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true

        self.containerView.addTopRoundedCornerToView(targetView: self.containerView, desiredCurve: 0.6)

    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
          
           return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryBoardConstants.storyBoards.NewWorkOrderStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NewWorkOrderDetails") as! NewWorkOrderDetailsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.prevVC = self
        self.present(controller, animated: true, completion: nil)

    }
    
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension UIView {

    func addTopRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?)
    {
        let offset:CGFloat =  targetView!.frame.width/desiredCurve!
        let bounds: CGRect = targetView!.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width+bounds.size.height / 2, height: bounds.size.height)

        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        targetView!.layer.mask = maskLayer
    }
}
