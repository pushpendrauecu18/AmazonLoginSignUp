//
//  CustomTableViewCell3.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 10/07/24.
//

import UIKit
class BrandTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //    let colors: [UIColor] = [#colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9607843137, alpha: 1),#colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9607843137, alpha: 1),#colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9607843137, alpha: 1),#colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9607843137, alpha: 1),#colorLiteral(red: 0.9490196078, green: 0.9568627451, blue: 0.9607843137, alpha: 1)]
    let colors: [UIColor] = [#colorLiteral(red: 0.6705882353, green: 0.9764705882, blue: 0.8901960784, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.9411764706, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0.9490196078, blue: 0.6352941176, alpha: 1), #colorLiteral(red: 0.8470588235, green: 0.6980392157, blue: 0.4470588235, alpha: 1), #colorLiteral(red: 0.5529411765, green: 0.5882352941, blue: 0.6980392157, alpha: 1)]
    let primeProduct = ["Hp.png","OnePlus.png","SurfExel.png","Bag.png","Perfumes.png"]
    let productOffer = ["Upto 35% off | Laptops","Mobiles| Starting  ₹18999","Upto 35% off | Liquids","Upto 35% off | Laptops","Upto 55% off | Perfumes",]
    @IBOutlet var labelPrimeDay: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return primeProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCollectionViewCell", for: indexPath) as! BrandCollectionViewCell
        cell.imageView.image = UIImage(named: primeProduct[indexPath.row])
        //        cell.button.setTitle(buttonOffer[indexPath.row], for: .normal)
        cell.ProductLabel.text = productOffer[indexPath.row]
        cell.imageView.backgroundColor = colors[indexPath.row]
        //cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 - 10, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
}
