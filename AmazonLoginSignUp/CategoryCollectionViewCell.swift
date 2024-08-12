//
//  CustomCollectionViewCell.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 08/07/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var labelImageC: UILabel!
    @IBOutlet var imageViewC: UIImageView!
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
           imageViewC.layer.cornerRadius = 5
           imageViewC.clipsToBounds = true
       }
   
}
