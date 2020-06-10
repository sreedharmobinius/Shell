//
//  NewWorkOrderDetailViewController.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 25/05/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit
import Photos

class NewWorkOrderDetailViewController: UIViewController, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate  {
    
    
    
    @IBOutlet weak var btnChooseEquipment: UIButton!
    
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray: [UIImage] = []
    
    private let spacing:CGFloat = 10.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        //        self.navigationController?.isNavigationBarHidden = false
        //        self.navigationController?.navigationBar.barTintColor = UIColor(red: 225/255, green: 24/255, blue: 20/255, alpha: 1.0)
        //        let button = UIButton(type: UIButton.ButtonType.custom)
        //        button.setImage(UIImage(named: "icon_fuel"), for: .normal)
        //        button.addTarget(self, action:#selector(closeButtonClicked), for: .touchDown)
        //        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        //        let barButton = UIBarButtonItem(customView: button)
        //        self.navigationItem.leftBarButtonItems = [barButton]
        //        let nav = UINib(nibName: "CustomNavView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        //        self.navigationItem.titleView = nav
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView?.collectionViewLayout = layout    }
    
    func configureButtons(){
        btnSubmit.layer.cornerRadius = 8
        btnSubmit.layer.borderWidth = 0.5
        btnChooseEquipment.layer.cornerRadius = 8
        btnChooseEquipment.layer.borderWidth = 0.5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! NewWorkOrderDetailCollectionViewCell
            
                   //cell.backgroundColor = UIColor.blue
    
               return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            pickerController.allowsEditing = false
            pickerController.showsCameraControls = true
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    @objc func closeButtonClicked(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnChooseEquipmentClicked(_ sender: Any) {
        //        let storyboard = UIStoryboard(name: "NewWorkOrder", bundle: nil)
        //        let controller = storyboard.instantiateViewController(withIdentifier: "newView")
        //        //let nav = UINavigationController(rootViewController: controller)
        //        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnCloseClicked(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnMinimiseClicked(_ sender: Any) {
    }
    
}
