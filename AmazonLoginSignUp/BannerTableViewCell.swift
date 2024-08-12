//
//  BannerTableViewCell.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 09/07/24.
//

import UIKit
class BannerTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var timer:Timer?
    let timeInterval:Double = 2.0
    var currentIndex:Int = 0
    var bannerImage:[String] = []
    var pageControl:UIPageControl!
    @IBOutlet var collectionView2: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView2.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        bannerImage = ["1.png","2.png","3.png","4.png","5.png","6.png"]
        // Add and configure UIPageControl
        pageControl = UIPageControl()
        pageControl.numberOfPages = bannerImage.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .red
        //pageControl.backgroundColor = .red
        pageControl.pageIndicatorTintColor = .white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(pageControl)
        
        // Set up constraints for UIPageControl
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(scrollNext), userInfo: nil, repeats: true)
    }
    // Methods for Page Control
    
    @objc func scrollNext() {
        guard bannerImage.count > 0 else { return }
        currentIndex = (currentIndex + 1) % bannerImage.count
        collectionView2.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: false)
        pageControl.currentPage = currentIndex
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        currentIndex = page
        pageControl.currentPage = page
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        currentIndex = page
        pageControl.currentPage = page
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        cell.imageView2.image = UIImage(named: bannerImage[indexPath.row])
        cell.imageView2.backgroundColor = .systemPurple
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView2.bounds.width
        //        let height = collectionView2.bounds.height
        return CGSize(width: width, height: 250)
    }
}
