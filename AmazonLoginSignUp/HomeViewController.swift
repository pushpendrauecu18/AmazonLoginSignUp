//  HomeViewController.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 07/07/24.
import UIKit
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var viewSideMenu = UIView()
    var tableViewSide = UITableView()
    var loginRow = ["Hello, Sir"]
    var section1 = ["Trending"]
    var titleRow1 = ["Best Sellers", "New Releases", "Movers and Shakers"]
    var section2 =  ["Digital Content and Devices"]
    var titleRow2 = ["Echo & Alexa", "Fire TV", "Kindle E-Readers & eBooks", "Audible Audiobooks", "Amazon Prime Video", "Amazon Prime Music"]
    var section3 = ["Shop by Category"]
    var titleRow3 = ["Mobiles, Computers", "TV","Appliances", "Men's Fashion"]
    
    
    enum HomeSection {
        case category
        case banner
        case separator
        case brand
        case product
    }
    var homeSectionArray: [HomeSection] = [.category,.banner,.separator,.brand,.separator,.product]
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchViewOutlet: UIView!
    @IBOutlet var SearchTextField: UITextField!
    @IBOutlet var btnSearch: UIButton!
    override func viewDidLoad(){
        super.viewDidLoad()
        setUpUI()
        setUpTableView()
    }
    func setUpUI()
    {
        searchViewOutlet.layer.cornerRadius = 20
        searchViewOutlet.layer.borderWidth = 5
        searchViewOutlet.layer.borderColor = UIColor.clear.cgColor
        btnSearch.layer.cornerRadius = 8
        btnSearch.layer.borderColor = UIColor.clear.cgColor
        btnSearch.layer.borderWidth = 5
        tableView.sectionHeaderTopPadding = 0 // for removing the default padding of table cell
    }
    func setUpTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SeparatorTableViewCell", bundle: nil), forCellReuseIdentifier: "SeparatorTableViewCell")
    }
    //For Side Menu
    @objc func dismissSideMenu(){
        UIView.animate(withDuration: 0.5) {
            let sideMenuWidth = (self.view.frame.width - 100)
            self.tableViewSide.frame = CGRect(x: -sideMenuWidth, y: 0, width: sideMenuWidth, height: self.view.frame.height)
            self.viewSideMenu.removeFromSuperview()
            DispatchQueue.main.asyncAfter ( deadline: .now() + 0.5) { self.tableViewSide.removeFromSuperview()
            }
        }
    }
    @IBAction func btnSideMenu(_ sender: UIButton)
    {
        
        // Setting up viewSideMenu
        viewSideMenu.frame = self.view.bounds
        viewSideMenu.backgroundColor = .black
        viewSideMenu.alpha = 0.8
        view.addSubview(viewSideMenu)
        
        // Setting up tableViewSide
        let sideMenuWidth = (self.view.frame.width - 100)
        tableViewSide = UITableView(frame: CGRect(x: 0, y: 0, width: sideMenuWidth, height: self.view.frame.height), style: .grouped)
        tableViewSide.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewSideCell")
        tableViewSide.backgroundColor = .white
        tableViewSide.delegate = self
        tableViewSide.dataSource = self
        view.addSubview(tableViewSide)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSideMenu))
        viewSideMenu.addGestureRecognizer(tapGesture)
        
        print("Btn clicked")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tableView {
            return 1
        } else {
            return 4 // Including loginRow as a separate section
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return homeSectionArray.count
        } else {
            switch section {
            case 0:
                return 1 //loginRow.count  // Only one row for the login button
            case 1:
                return titleRow1.count
            case 2:
                return titleRow2.count
            case 3:
                return titleRow3.count
            default:
                return 0
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            
            switch homeSectionArray[indexPath.row] {
            case .product:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
                cell.collectionHeightContraint.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
                return cell
            case .category:
                return tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            case.separator:
                return tableView.dequeueReusableCell(withIdentifier: "SeparatorTableViewCell", for: indexPath) as! SeparatorTableViewCell
            case .brand:
                return tableView.dequeueReusableCell(withIdentifier: "BrandTableViewCell", for: indexPath) as! BrandTableViewCell
            case .banner:
                return tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            }
            
        }else {
            if indexPath.section == 0 {
                // Create a cell for the login button
                let cell = UITableViewCell()
                cell.backgroundColor = .clear
                
                let loginButton = UIButton(type: .system)
                loginButton.setImage(UIImage(systemName: "person.circle.fill"), for: .normal)
                loginButton.setTitle(" Hello, Sir", for: .normal)
                loginButton.tintColor = .white // #colorLiteral(red: 0.1333333333, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
                loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
                loginButton.setTitleColor(.white, for: .normal)
                loginButton.backgroundColor = #colorLiteral(red: 0.1333333333, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
                loginButton.contentHorizontalAlignment = .left
                loginButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
                loginButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
                
                loginButton.frame = CGRect(x: 0, y: 0, width: tableViewSide.frame.width, height: 50)
                cell.contentView.addSubview(loginButton)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewSideCell", for: indexPath)
                cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
                switch indexPath.section {
                case 1:
                    cell.textLabel?.text = titleRow1[indexPath.row]
                case 2:
                    cell.textLabel?.text = titleRow2[indexPath.row]
                case 3:
                    cell.textLabel?.text = titleRow3[indexPath.row]
                default:
                    cell.textLabel?.text = ""
                }
                cell.backgroundColor = .clear
                //  separators for end of sections 1, 2, and 3
                if indexPath.section != 0 && indexPath.row == self.tableView(tableView, numberOfRowsInSection: indexPath.section) - 1 {
                    let separator = UIView(frame: CGRect(x: 0, y: cell.frame.size.height - 1, width: cell.frame.size.width, height: 1))
                    separator.backgroundColor = .lightGray
                    cell.addSubview(separator)
                }
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView {
            switch homeSectionArray[indexPath.row] {
            case .banner:
                return 250
            case .category:
                return 120
            case .separator:
                return 5
            case .brand:
                return 220
            case .product:
                return UITableView.automaticDimension
            }
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == self.tableView {
            return nil
        } else {
            let headerView = UIView()
            headerView.backgroundColor = .white
            let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 50))
            headerLabel.textColor = .black
            headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
            switch section {
            case 1:
                headerLabel.text = section1[0]
            case 2:
                headerLabel.text = section2[0]
            case 3:
                headerLabel.text = section3[0]
            default:
                headerLabel.text = ""
            }
            headerView.addSubview(headerLabel)
            return headerView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == self.tableView {
            return 0
        } else {
            if section == 0 {
                return 0 // No header for the login row
            }
            return 50
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        print("y offset", y)
    }
}
