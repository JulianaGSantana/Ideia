//
//  FirstCollectionCell.swift
//  Ideia
//
//  Created by Juliana Santana on 16/07/21.
//

import UIKit
import Foundation

class FirstCollectionCell: UICollectionViewCell {
    var ideaType: IdeaType = .anatomia
    
   
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        
    }
}
     
  


