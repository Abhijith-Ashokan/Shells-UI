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
               self.contentView.backgroundColor = isSelected ? UIColor.gray : UIColor.clear
           }
       }
}
