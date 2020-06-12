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
    
    
    
    @IBOutlet weak var horizontalDispenserSuperView: UIView!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackView: UIStackView!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackView: UIStackView!
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewFirstButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewSecondButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewThirdButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewFourthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewFifthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackViewSixthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewFirstButton: UIButton!
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewSecondButton: UIButton!
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewThirdButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewFourthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewFifthButton: UIButton!
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewSixthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewSeventhButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewEighthButton: UIButton!
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewNinethButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewTenthButton: UIButton!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewEleventhButton: UIButton!
    
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackViewTwelevethButton: UIButton!
    
    
    
    
    
    
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        func hideAllForVerticalLayout(){
            let stackViews = [firstHorizontalStackView,secondHorizontalStackView,thirdHorizontalStackView,fourthHorizontalStackView,fifthHorizontalStackView,sixthHorizontalStackView]
            
            for view in stackViews{
                view?.isHidden = true
            }
            let buttonCollection = [firstButton,secondButton,thirdButton,fourthButton,fifthButton,sixthButton,seventhButton,eighthButton,ninethButton,tenthButton,eleventhButton,twelevethButton,secondVerticalButton,thirdVerticalButton,fourthVerticalButton,fifthVerticalButton,sixthVerticalButton]
            for button in buttonCollection{
                button?.isHidden = true
            }
           
        }
    
    func hideAllForHorizontalLayout(){
        
        let stackViewsAndButtons = [horizontalLayoutFirstVerticalStackView,horizontalLayoutSecondVerticalStackView,   horizontalLayoutFirstVerticalStackViewFirstButton,horizontalLayoutFirstVerticalStackViewSecondButton, horizontalLayoutFirstVerticalStackViewThirdButton,horizontalLayoutFirstVerticalStackViewFourthButton,horizontalLayoutFirstVerticalStackViewFifthButton,horizontalLayoutFirstVerticalStackViewSixthButton,horizontalLayoutSecondVerticalStackViewFirstButton,horizontalLayoutSecondVerticalStackViewSecondButton,horizontalLayoutSecondVerticalStackViewThirdButton,horizontalLayoutSecondVerticalStackViewFourthButton,horizontalLayoutSecondVerticalStackViewFifthButton,horizontalLayoutSecondVerticalStackViewSixthButton,horizontalLayoutSecondVerticalStackViewSeventhButton,horizontalLayoutSecondVerticalStackViewEighthButton,horizontalLayoutSecondVerticalStackViewNinethButton,horizontalLayoutSecondVerticalStackViewTenthButton,horizontalLayoutSecondVerticalStackViewEleventhButton,horizontalLayoutSecondVerticalStackViewTwelevethButton
        ]
        for view in stackViewsAndButtons{
            view?.isHidden = true
        }
        
        
        
    }
    
    
        
        func showOrHideDispenserButton(count:Int){
            hideAllForVerticalLayout()
            horizontalDispenserSuperView.isHidden = true
            
            if count == 1{
                showButtonOrView(views:[firstHorizontalStackView,firstButton])
                
            }
           else if count == 2 {
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView])

            }
          else  if count == 3{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton])
            }
            
           else if count == 4{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton])

            }
           else if count == 5{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton,fifthHorizontalStackView,fifthVerticalButton])

            }
            
          else  if count == 6{
      showButtonOrView(views:[firstHorizontalStackView,firstButton,secondVerticalButton,secondHorizontalStackView,thirdHorizontalStackView,thirdVerticalButton,fourthHorizontalStackView,fourthVerticalButton,fifthHorizontalStackView,fifthVerticalButton,sixthHorizontalStackView,sixthVerticalButton])

            }
            
         else  if count == 8{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton])
                
            }
            
           else if count == 10{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton,fifthHorizontalStackView,ninethButton,tenthButton])
                
            }
           else if count == 12{
                showButtonOrView(views:[firstHorizontalStackView,firstButton,secondButton,secondHorizontalStackView,thirdButton,fourthButton,thirdHorizontalStackView,fifthButton,sixthButton,fourthHorizontalStackView,seventhButton,eighthButton,fifthHorizontalStackView,ninethButton,tenthButton])
                sixthHorizontalStackView.isHidden = false
                eleventhButton.isHidden = false
                twelevethButton.isHidden = false
                
            }
            else{
                return
            }
            
        }
        
        func  showButtonOrView(views:[UIView]){
            for view in views{
                view.isHidden = false
            }
            
        }
    
    
    func showOrHideHorizontalLayoutDispenserButton(count:Int){
        hideAllForHorizontalLayout()
        
        if count == 1{
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFifthButton])
        }
        else if count == 2 {
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFifthButton,horizontalLayoutFirstVerticalStackViewSecondButton])

        }
        else if count == 3 {
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFifthButton,horizontalLayoutFirstVerticalStackViewSecondButton,horizontalLayoutFirstVerticalStackViewThirdButton])

        }
        
        else if count == 4 {
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFifthButton,horizontalLayoutFirstVerticalStackViewSecondButton,horizontalLayoutFirstVerticalStackViewThirdButton,horizontalLayoutFirstVerticalStackViewFourthButton])
            
        }
        
        else if count == 5 {
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFirstButton,horizontalLayoutFirstVerticalStackViewSecondButton,horizontalLayoutFirstVerticalStackViewThirdButton,horizontalLayoutFirstVerticalStackViewFourthButton,horizontalLayoutFirstVerticalStackViewFifthButton])
            
        }
        else if count == 6 {
            showButtonOrView(views:[horizontalLayoutFirstVerticalStackView,horizontalLayoutFirstVerticalStackViewFirstButton,horizontalLayoutFirstVerticalStackViewSecondButton,horizontalLayoutFirstVerticalStackViewThirdButton,horizontalLayoutFirstVerticalStackViewFourthButton,horizontalLayoutFirstVerticalStackViewFifthButton,horizontalLayoutFirstVerticalStackViewSixthButton])
             
        }
        
        else if count == 8 {
            showButtonOrView(views: [horizontalLayoutFirstVerticalStackView,horizontalLayoutSecondVerticalStackView,horizontalLayoutFirstVerticalStackViewFirstButton,horizontalLayoutFirstVerticalStackViewSecondButton,horizontalLayoutFirstVerticalStackViewThirdButton,horizontalLayoutFirstVerticalStackViewFourthButton,horizontalLayoutSecondVerticalStackViewFifthButton,horizontalLayoutSecondVerticalStackViewSixthButton,horizontalLayoutSecondVerticalStackViewSeventhButton,horizontalLayoutSecondVerticalStackViewEighthButton])
            
        }
     
        
    }
        
   
}
