//
//  HubsCollectonViewCollectionViewCell.swift
//  Shells UI
//
//  Created by Abhijith on 07/09/22.
//

import UIKit

class HubsCollectionViewCell: UICollectionViewCell{

    @IBOutlet var hubs: UILabel!
    
    override var isSelected: Bool {
           didSet {
               let border = CALayer()
               border.borderWidth = 3
               border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.size.width, height: 1)
               if isSelected{
                    addSelectionBorder()
               }
               else{
                   removeSelectionBorder()
               }
               func addSelectionBorder(){
                   border.borderColor = UIColor.cyan.withAlphaComponent(1).cgColor
                   self.layer.addSublayer(border)
                   self.layer.masksToBounds = true
               }
               func removeSelectionBorder(){
                   border.borderColor = UIColor.clear.withAlphaComponent(1).cgColor
                   self.layer.addSublayer(border)
                   self.layer.masksToBounds = true
                   
               }
               
            }
       }
}
