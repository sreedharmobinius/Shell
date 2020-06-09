//
//  PhotoEvidenceTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 06/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class PhotoEvidenceTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray: [UIImage] = []

    private let spacing:CGFloat = 10.0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView?.collectionViewLayout = layout
        collectionView?.register(PhotoEvidenceCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoEvidence")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return (section == 0) ? 1 : 4
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoEvidence", for: indexPath) as! PhotoEvidenceCollectionViewCell
         if imageArray.count > 0{
             cell.imageView.image = imageArray[0]
         }
         return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         if UIImagePickerController.isSourceTypeAvailable(.camera) {
             let pickerController = UIImagePickerController()
             pickerController.delegate = self
             pickerController.sourceType = .camera
             pickerController.allowsEditing = false
             pickerController.showsCameraControls = true
             //self.present(pickerController, animated: true, completion: nil)
         }
         
     }
     
     func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 2
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width : CGFloat
         let height : CGFloat

         if indexPath.section == 0 {
             // First section
             width = 300
             height = 300
             return CGSize(width: width, height: height)
         } else {
             // Second section
             width = 70
             height = 70
             return CGSize(width: width, height: height)
         }

     }
    
     
     
     // MARK: - ImagePicker functions.
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         guard let image = info[.originalImage] as? UIImage else { return }
         //dismiss(animated: true)
         imageArray.append(image)
         collectionView.reloadData()
     }
     
//     @objc func closeButtonClicked(){
//         self.dismiss(animated: true, completion: nil)
//     }
     
}
