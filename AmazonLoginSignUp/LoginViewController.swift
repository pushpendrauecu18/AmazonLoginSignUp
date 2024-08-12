//  LoginViewController.swift
//  AmazonLoginSignUp
//  Created by Pushpendra on 01/07/24.
import UIKit
//import NotificationCenter //like a radio
class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var iamnewCustomer: UIButton!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet weak var webLinkTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        iamnewCustomer.layer.borderWidth = 1
        iamnewCustomer.backgroundColor = .clear
        iamnewCustomer.layer.borderColor = UIColor.gray.cgColor
        iamnewCustomer.layer.cornerRadius = 5
        //        iamnewCustomer.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 5
        iconImage()
        hideKyboard() //Hiding the keyboard
        txtPassword.delegate = self
        txtEmail.delegate = self
        txtEmail.returnKeyType = .next
        txtPassword.returnKeyType = .done
    }
    @IBAction func btnLogin(_ sender: UIButton)
    {
        let mobi = txtEmail.text ?? ""
        let pass = txtPassword.text ?? ""
        
        let credentials = fetchCredentials()
        if let mobile = credentials.mobilenumber, let password = credentials.password {
            if mobi == mobile && pass == password {
                showAlert(title:"Login", message:"Successfully Login")
                
            } else {
                showAlert(title:"Retry", message:"Entered Credentials are Not Correct")
            }
        } else {
            print("No credentials found.")
            showAlert(title:"Retry", message:"Entered Credentials are Not Correct")
        }
    }
    //For alert
    func navigateToHomeController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            self.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    func showAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if title == "Login"
        {
            let action = UIAlertAction(title: "Ok", style: .default) { _ in
                self.navigateToHomeController()
            }
            alert.addAction(action)
        }else{
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
        }
        
        self.present(alert, animated:true, completion:nil)
    }
    
    
    //    func showAlert()
    //    {
    //        let alert = UIAlertController(title: "Login", message: "Successfully Login", preferredStyle: .alert)
    //        alert.addAction(UIAlertAction(title: "Ok", style: .default))
    //        self.present(alert, animated: true, completion: nil)
    //    }
    //    func showNoAlert()
    //    {
    //        let alert = UIAlertController(title: "Login", message: "Entered Credentials are Not Correct", preferredStyle: .alert)
    //        alert.addAction(UIAlertAction(title: "Retry", style: .destructive))
    //        self.present(alert, animated: true, completion: nil)
    //    }
    func fetchCredentials() -> (mobilenumber: String?, password: String?) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = path[0]
        let finalPath = fullPath + "/userlogin"
        print("FinalPath: \(finalPath)")
        
        // Permission to read/write
        let fileManager = FileManager()
        if fileManager.fileExists(atPath: finalPath) {
            do {
                let dics = NSDictionary(contentsOfFile: finalPath)
                if let creds = dics as? [String:Any] {
                    if let mob = creds["mobileno"] as? String, let password = creds["password"] as? String {
                        return(mob,password)
                    }
                }
                return (nil,nil)
            } catch {
                print("Error reading file: \(error)")
                return (mobilenumber: nil, password: nil)
            }
        } else {
            print("File does not exist.")
            return (mobilenumber: nil, password: nil)
        }
    }
    
    
    
    //    func save(emailphone:String, password:String)
    //    {
    //        UserDefaults.standard.set(emailphone, forKey: "Email")
    //        UserDefaults.standard.set(password, forKey: "Password")
    //    }
    //    func get() -> String
    //    {
    //        if let username = UserDefaults.standard.value(forKey: "Email") as? String
    //        {
    //            return username
    //        }
    //        if let pass = UserDefaults.standard.value(forKey: "Password") as? String
    //        {
    //            return pass
    //        }
    //        else
    //        {
    //            return ""
    //        }
    //    }
    @IBAction func btnNewCustomer(_ sender: UIButton)
    {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let create = story.instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        self.navigationController?.pushViewController(create, animated: true)
    }
    @IBAction func btnConditions(_ sender: UIButton)
    {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    @IBAction func btnPrivacy(_ sender: UIButton)
    {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    
    @IBAction func btnHelp(_ sender: UIButton) {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    @IBAction func btnForgotPassword(_ sender: UIButton)
    {
        forgot()
    }
    
    func forgot()
    {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let forget = stBoard.instantiateViewController(withIdentifier: "ForgotViewController") as! ForgotViewController
        self.navigationController?.pushViewController(forget, animated: true)
    }
    func iconImage()
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24)) // we took view because size of the image not worked
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .black
        //        button.frame = CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPasswordVisibleClicked), for: .touchUpInside)
        view.addSubview(button)
        txtPassword.rightView = view
        txtPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 24)) //txtPassword.leftView for giving some space on left side of txtfield
        txtPassword.leftViewMode = .always
        txtPassword.rightViewMode = .always
    }
    
    @IBAction func btnPasswordVisibleClicked(_ sender:Any)
    {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected
        {
            self.txtPassword.isSecureTextEntry = false
        }else
        {
            self.txtPassword.isSecureTextEntry = true
        }
    }
}
extension LoginViewController
{
    func hideKyboard()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismisMyKeyboard()
    {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtEmail.resignFirstResponder() // for txtfld first
            txtPassword.becomeFirstResponder() //for make next fist txtfld
        }
        else{
            txtPassword.resignFirstResponder()
        }
        return true
    }
}


