//
//  SelectEquipmentLayoutTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class SelectEquipmentLayoutTableViewCell: UITableViewCell {

   @IBOutlet weak var firstHorizontalStackView: UIStackView!
        
        @IBOutlet weak var secondHorizontalStackView: UIStackView!
        
        @IBOutlet weak var thirdHorizontalStackView: UIStackView!
        @IBOutlet weak var fourthHorizontalStackView: UIStackView!
        
        @IBOutlet weak var sixthHorizontalStackView: UIStackView!
        
        @IBOutlet weak var fifthHorizontalStackView: UIStackView!
        
        @IBOutlet weak var firstButton: UIButton!
        
        @IBOutlet weak var secondButton: UIButton!
        
        @IBOutlet weak var thirdButton: UIButton!
        
        @IBOutlet weak var fourthButton: UIButton!
        @IBOutlet weak var fifthButton: UIButton!
        @IBOutlet weak var sixthButton: UIButton!
        @IBOutlet weak var seventhButton: UIButton!
        
        @IBOutlet weak var eighthButton: UIButton!
        @IBOutlet weak var ninethButton: UIButton!
        @IBOutlet weak var tenthButton: UIButton!
        @IBOutlet weak var eleventhButton: UIButton!
        
        @IBOutlet weak var twelevethButton: UIButton!
        
        @IBOutlet weak var secondVerticalButton: UIButton!
        
        @IBOutlet weak var thirdVerticalButton: UIButton!
        @IBOutlet weak var fourthVerticalButton: UIButton!
        
        @IBOutlet weak var fifthVerticalButton: UIButton!
        
        @IBOutlet weak var sixthVerticalButton: UIButton!
        
       
        
        
        @IBOutlet weak var dispenserButtonCollectionView: UIStackView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        func hideAll(){
            let stackViews = [firstHorizontalStackView,secondHorizontalStackView,thirdHorizontalStackView,fourthHorizontalStackView,fifthHorizontalStackView,sixthHorizontalStackView]
            
            for view in stackViews{
                view?.isHidden = true
            }
            let buttonCollection = [firstButton,secondButton,thirdButton,fourthButton,fifthButton,sixthButton,seventhButton,eighthButton,ninethButton,tenthButton,eleventhButton,twelevethButton,secondVerticalButton,thirdVerticalButton,fourthVerticalButton,fifthVerticalButton,sixthVerticalButton]
            for button in buttonCollection{
                button?.isHidden = true
            }
           
        }
        
        func showOrHideDispenserButton(count:Int){
            hideAll()
         // .addBorders(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)

            if count == 1{
                showButtonOrView(views:[firstHorizontalStackView,firstButton])
                
            }
            if count == 2 {
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView])

            }
            if count == 3{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton])
            }
            
            if count == 4{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton])

            }
            if count == 5{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton,fifthHorizontalStackView,fifthVerticalButton])

            }
            
            if count == 6{
      showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton,fifthHorizontalStackView,fifthVerticalButton,sixthHorizontalStackView,sixthVerticalButton])

            }
            
            if count == 8{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton])
                
            }
            
            if count == 10{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton,fifthHorizontalStackView,ninethButton,tenthButton])
                
            }
            if count == 12{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton,fifthHorizontalStackView,ninethButton,tenthButton])
                sixthHorizontalStackView.isHidden = false
                eleventhButton.isHidden = false
                twelevethButton.isHidden = false
                
            }
            
        }
        
        func  showButtonOrView(views:[UIView]){
            for view in views{
                view.isHidden = false
            }
            
        }
        
   
}
