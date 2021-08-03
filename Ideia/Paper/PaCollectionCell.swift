//
//  ViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 22/07/21.
//

import UIKit
import Foundation

class PaCollectionCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
    }
    }
    


