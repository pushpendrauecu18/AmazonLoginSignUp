//
//  CustomTableViewCell4.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 10/07/24.
//

import UIKit
class ProductTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let colors: [UIColor] = [#colorLiteral(red: 0.6705882353, green: 0.9764705882, blue: 0.8901960784, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.9411764706, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0.9490196078, blue: 0.6352941176, alpha: 1), #colorLiteral(red: 0.8470588235, green: 0.6980392157, blue: 0.4470588235, alpha: 1), #colorLiteral(red: 0.5529411765, green: 0.5882352941, blue: 0.6980392157, alpha: 1), #colorLiteral(red: 0.8470588235, green: 0.6980392157, blue: 0.4470588235, alpha: 1), #colorLiteral(red: 0.5607843137, green: 0.9411764706, blue: 0.968627451, alpha: 1), #colorLiteral(red: 0.8980392157, green: 0.9490196078, blue: 0.6352941176, alpha: 1), #colorLiteral(red: 0.1333333333, green: 0.1843137255, blue: 0.2470588235, alpha: 1), #colorLiteral(red: 0.5529411765, green: 0.5882352941, blue: 0.6980392157, alpha: 1)]
    let product = ["Hp.png","OnePlus.png","SurfExel.png","Bag.png","Perfumes.png","Hp.png","OnePlus.png","SurfExel.png","Bag.png","Perfumes.png"]
    let productName = ["My First Library: Boxset of...","Mobiles","Liquids","Laptops","Perfumes","Laptops","Mobiles","Liquids","Laptops","Perfumes",]
    let productPrice1 = ["₹269","₹293","₹1269","₹267","₹219","₹209","₹569","₹969","₹989","₹869",]
    let productPrice2 = ["₹374","₹674","₹1474","₹364","₹334","₹474","₹874","₹1024","₹1274","₹974",]
    let productPrice3 = ["-47%","-47%","-47%","-47%","-47%","-47%","-47%","-47%","-47%","-47%",]
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionHeightContraint: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.imageView.image = UIImage(named: product[indexPath.row])
        cell.labelName.text = productName[indexPath.row]
        cell.labelPrice1.text = productPrice1[indexPath.row]
        cell.labelPrice2.text = productPrice2[indexPath.row]
        cell.labelPrice3.text = productPrice3[indexPath.row]
        cell.imageView.backgroundColor = colors[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width / 2 - 30, height: height - 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
