//
//  CustomTableViewCell.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 08/07/24.

import UIKit

class CategoryTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let imagesTitle = ["Prime","Mobiles","Fashion","Deals","miniTV","Electronics","Prime","Mobiles","Fashion","Deals","miniTV","Electronics"]
    let images = ["Prime.png","Mobile.png","Fashion.png","Tags.png","MiniTv.png","Electronics.png","Prime.png","Mobile.png","Fashion.png","Tags.png","MiniTv.png","Electronics.png"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var collectionViewBanner: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.imageViewC.image = UIImage(named: images[indexPath.row])
        cell.labelImageC.text = imagesTitle[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let collectionWidth = collectionView.bounds.width
        //let collectionHeight = collectionView.bounds.height
        //print("\(collectionHeight)")
        return CGSize(width: 90  , height: 120  )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
    }
    
}





//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let collectionHeight = collectionView.bounds.height
//    return CGSize(width: collectionHeight, height: collectionHeight)
//}
//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//    return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//}
//
//func collectionView(_ collectionView: UICollecti
//    var selectedIndex = [Int]()
//    var imagesCollection = [["name":"Prime","image_name":"Prime.png"], ["name":"Mobiles","image_name":"Mobiles.png"],["name":"Fashion","image_name":"Fashion.png"],["name":"Deals","image_name":"Deals.png"],["name":"miniTV","image_name":"miniTv.png"],["name":"Electronics","image_name":"Electronics.png"]]
//
