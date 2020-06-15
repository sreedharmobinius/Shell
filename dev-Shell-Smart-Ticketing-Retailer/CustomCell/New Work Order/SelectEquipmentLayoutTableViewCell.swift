//
//  SelectEquipmentLayoutTableViewCell.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 01/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import UIKit

class SelectEquipmentLayoutTableViewCell: UITableViewCell {
    @IBOutlet weak var verticalLayoutSuperView: UIView!
    
    @IBOutlet weak var horizontalLayoutSuperView: UIView!
    
    @IBOutlet weak var horizontalLayoutFirstVerticalStackView: UIStackView!
    
    @IBOutlet weak var horizontalLayoutSecondVerticalStackView: UIStackView!
    
    @IBOutlet weak var verticalLayoutFirstVerticalStackView: UIStackView!
    
    @IBOutlet weak var verticalLayoutSecondVerticalStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var isFirstTime:Bool = true
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func drawDispenserForHorizontalLayout(rowCount:Int,columnCount:Int){
        
        if isFirstTime == true {
            if columnCount == 1{
                horizontalLayoutFirstVerticalStackView.isHidden = false
                
                for tag in 1...rowCount{
                    drawCustomButton(tag:tag,ViewName:horizontalLayoutFirstVerticalStackView, layout: "horizontal")
                    
                }
            }
            else if columnCount == 2{
                horizontalLayoutFirstVerticalStackView.isHidden=false
                horizontalLayoutSecondVerticalStackView.isHidden = false
                for tag in 1...rowCount{
                    drawCustomButton(tag:tag,ViewName:horizontalLayoutFirstVerticalStackView, layout: "horizontal")
                    
                }
                for tag in rowCount+1...rowCount*2{
                    drawCustomButton(tag:tag,ViewName:horizontalLayoutSecondVerticalStackView, layout: "horizontal")
                    
                }
                
            }
            else{
                return
            }
            isFirstTime = false
        }
        
    }
    
    
    func drawDispenserForVerticalLayout(rowCount:Int, columnCount: Int){
        
        if isFirstTime == true{
            horizontalLayoutSuperView.isHidden = true
            if columnCount == 1{
                verticalLayoutFirstVerticalStackView.isHidden = false
                for tag in (1...rowCount).reversed(){
                    drawCustomButton(tag:tag,ViewName:verticalLayoutFirstVerticalStackView, layout: "vertical")
                    
                }
                
                
            }
                
            else if columnCount == 2{
                verticalLayoutFirstVerticalStackView.isHidden = false
                verticalLayoutSecondVerticalStackView.isHidden = false
                
                for tag in (1...rowCount*2).reversed(){
                    
                    if tag%2 == 1{
                        drawCustomButton(tag:tag,ViewName:verticalLayoutFirstVerticalStackView, layout: "vertical")
                        
                    }
                    else{
                        drawCustomButton(tag:tag,ViewName:verticalLayoutSecondVerticalStackView, layout: "vertical")
                    }
                    
                }
                
                
            }
                
            else{
                return
            }
            isFirstTime = false
        }
        
    }
    
    func drawCustomButton(tag:Int,ViewName:UIStackView,layout:String){
        let button = UIButton()
        if layout == "horizontal"{
            button.setImage(UIImage.init(named: "HorLayoutButton\(tag)"), for:.normal)
        }
        else if layout == "vertical"{
            button.setImage(UIImage.init(named: "verLayoutButton\(tag)"), for:.normal)
            
        }
        button.tag = tag
        button.addTarget(self, action: #selector(buttonTapped(sender: )), for:   UIControl.Event.touchUpInside)
        button.backgroundColor = UIColor().HexToColor(hexString: StoryBoardConstants.hexString.hexStringForLayoutButtonColour, alpha: 1.0)
        ViewName.spacing = 5
        ViewName.addArrangedSubview(button)
        print(button.tag)
        
    }
    
    @objc func buttonTapped(sender:UIButton){
        let button = sender
        print("pressed button \(button.tag)")
        
    }
    
    
    
}


extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}











