//  CreateViewController.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 01/07/24.
import UIKit
class CreateViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    let nationality = ["Indian","USA","UK","Indian","USA","UK","Indian","USA","UK"]
    let placeholderText = "Enter Enter Discription here...."
    let datePicker = UIDatePicker()
    
    @IBOutlet var txtDOB: UITextField!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var userName: UITextField!
    @IBOutlet var mobileNumber: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var lblDisability: UILabel!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var txtNationality: UITextField!
    @IBOutlet var switchOutLet: UISwitch!
    @IBOutlet var textViewOutlet: UITextView!
    @IBOutlet var sliderOutlet: UISlider!
    @IBOutlet var ageLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getData()
        createButton.layer.cornerRadius = 5
        switchOutLet.layer.borderWidth = 1
        switchOutLet.layer.cornerRadius = 13
        switchOutLet.layer.borderColor = UIColor.lightGray.cgColor
        //sliderOutlet.layer.borderWidth = 1
        //sliderOutlet.layer.cornerRadius = 13
        //sliderOutlet.layer.borderColor = UIColor.lightGray.cgColor
        iconImage()
        hideKyboard()
        txtPassword.delegate = self
        //txtPassAgain.delegate = self
        firstName.delegate = self
        lastName.delegate = self
        userName.delegate = self
        confirmPassword.delegate = self
        textViewOutlet.delegate = self
        firstName.returnKeyType = .next
        lastName.returnKeyType = .next
        txtPassword.returnKeyType = .next
        textViewOutlet.returnKeyType = .next
        
        
        // For move to next texfield without outlet providing tag to each textfield
        //        for tag in 5...10{
        //            if let textField = self.view.viewWithTag(tag) as? UITextField{
        //                textField.delegate = self
        //            }
        //        }
        
        CreateDatePicker()
        CreatPickerView()
        //textViewOutlet.isHidden = !switchOutLet.isOn
        textViewOutlet.delegate = self
        textViewOutlet.text = placeholderText
        textViewOutlet.textColor = UIColor.lightGray
        textViewOutlet.layer.borderWidth = 1
        textViewOutlet.layer.borderColor = UIColor.darkGray.cgColor
        
        
        // textViewOutlet.text = "" // Initialize lblDisability with a default value
    }
    
    func CreatPickerView(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        txtNationality.inputView = picker
    }
    
    // UITextFieldDelegate method to limit text length
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        return true
    //    }
    
    // For Disability
    @IBAction func switchAction(_ sender: Any) {
        if !switchOutLet.isOn
        {
            textViewOutlet.isHidden = true
            textViewOutlet.resignFirstResponder()
        }
        else
        {
            textViewOutlet.isHidden = false
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
    // For Selection of Age
    @IBAction func sliderAction(_ sender: Any) {
        ageLabel.text = String(Int(sliderOutlet.value)) //double into string and string into Int slider accepts int
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nationality.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nationality[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedItem = nationality[row]
        txtNationality.text = "\(selectedItem)"
        //        txtNationality.resignFirstResponder()
        print("\(selectedItem)")
    }
    @IBAction func btnCreate(_ sender: UIButton)
    {
        // let alert = UIAlertController(title: "", message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
        guard let firstName = firstName.text,
              let lastName = lastName.text,
              let userName = userName.text,
              let mobileNumber = mobileNumber.text,
              let txtDOB = txtDOB.text,
              let nationality = txtNationality.text,
              let txtPassword = txtPassword.text,
              let confirmPassword = confirmPassword.text
        else {
            return
        }
        //let disablity = textViewOutlet.text
        //        let disabilityText = lblDisability.text ?? ""
        let disability = textViewOutlet.text
        let age = Int(ageLabel.text ?? "") ?? 0
        saveCreateData(fname: firstName, lname: lastName, uname: userName, mobilenumber: mobileNumber, dob: txtDOB, nationality: nationality, disablity: textViewOutlet.text, age: Int(ageLabel.text ?? "") ?? 0, password: txtPassword, confirmpassword: confirmPassword)
    }
    // Save data in pList
    func saveCreateData(fname:String,lname:String, uname:String, mobilenumber:String,dob:String,nationality:String,disablity:String,age:Int,password:String, confirmpassword:String )
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = path[0]
        let finalPath = fullPath + "/userlogin"
        print("FinalPath: \(finalPath)")
        //permission to read write
        let filemanager = FileManager()
        //For no duplicate data
        if !filemanager.fileExists(atPath: finalPath)
        {
            let dictionary: [String: Any] = [
                "firstname": fname,
                "lastname": lname,
                "username": uname,
                "mobileno": mobilenumber,
                "dateofbirth": dob,
                "nationality": nationality,
                "disability": disablity,
                "age": age,
                "password": password,
                "confirmpassword": confirmpassword
            ]
            //let dics = NSDictionary(dictionary: dictionary)
            // dics.write(toFile: finalPath, atomically: true)
            NSDictionary(dictionary: dictionary).write(toFile: finalPath, atomically: true) //Alternatively, if you do not need the dics variable, you can directly write the dictionary to the file:
            //let dics = NSDictionary(dictionary: dictionary)
            //_ = dics.write(toFile: finalPath, atomically: true) // Using `_ =` to suppress the unused variable warning
        }
        else
        {
            print("plist already generated")
        }
    }
    func getData()
    {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = path[0]
        let finalPath = fullPath + "/userlogin"
        let filemanager = FileManager()
        if filemanager.fileExists(atPath: finalPath)
        {
            let dics = NSDictionary(contentsOfFile: finalPath)
        }else{print("Data not saved")}
    }
    @IBAction func btnSignin(_ sender: UIButton)
    {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func conditionBtn(_ sender: UIButton) {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    @IBAction func privacyBtn(_ sender: UIButton) {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    @IBAction func helpBtn(_ sender: UIButton) {
        let stBoard = UIStoryboard(name: "Main", bundle: nil)
        let pCH = stBoard.instantiateViewController(withIdentifier: "PrivacyConditionHelp") as! PrivacyConditionHelp
        self.navigationController?.pushViewController(pCH, animated: true)
    }
    
    //    func save(name:String, email:String, password:String, passAgain:String)
    //    {
    //        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    //        let fullPath = path[0]
    //        let finalPath = fullPath + "/create.plist"
    //        print("FinalPath: \(finalPath)")
    //        // Permission to read write
    //        let filemanager =  FileManager()
    //
    //        // Prevent duplicacy of files
    //        if !filemanager.fileExists(atPath: finalPath)
    //        {
    //            let dictiony: [String: String] = [
    //                "Name": name,
    //                "Email": email,
    //                "Password": password,
    //                "PassAgain": passAgain]
    //            let dict = NSDictionary(dictionary: dictiony) // type cast using nsdictionary
    //            dict.write(toFile: finalPath, atomically: true)
    //            //            print("Details: \(name),\(email),\(password),\(passAgain)")
    //        }
    //        else
    //        {
    //            print("plist already generated")
    //        }
    //    }
    //    func get()
    //    {
    //        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    //        let fullPath = path[0]
    //        let finalPath = fullPath + "/create.plist" // breakpoint and check final path and match with save() final path
    //        let filemanager = FileManager()
    //        if filemanager.fileExists(atPath: finalPath)
    //        {
    //            let dic = NSDictionary(contentsOfFile: finalPath)
    //            print(dic)
    //        }
    //        else
    //        {
    //            print("Not saved")
    //        }
    //    }
    //Set icon image for password
    func iconImage()
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 24))
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.btnPasswordVisibleClicked), for: .touchUpInside)
        view.addSubview(button)
        txtPassword.rightView = view
        //txtPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 24))
        //txtPassword.leftViewMode = .always
        txtPassword.rightViewMode = .always
    }
    @IBAction func btnPasswordVisibleClicked(_ sender:UIButton)
    {
        (sender as UIButton).isSelected = !(sender as UIButton).isSelected
        if (sender as UIButton).isSelected
        {
            self.txtPassword.isSecureTextEntry = false
        }else
        {
            self.txtPassword.isSecureTextEntry = true
        }
    }
}
extension CreateViewController
{
    //Keyboard Handling
    func hideKyboard()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismisMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismisMyKeyboard()
    {
        view.endEditing(true)
    }
    // func textFieldShouldReturn For move to next texfield without outlet providing tag to each textfield
    //        func textFieldShouldReturn(_ textField: UITextField) -> Bool
    //        {
    //            let nextTag = textField.tag + 1
    //            if let nextResponder = self.view.viewWithTag(nextTag) as? UITextField{
    //                textField.resignFirstResponder()
    //                nextResponder.becomeFirstResponder()
    //            }else{
    //                textField.resignFirstResponder()
    //            }
    //                return true
    //        }
    //        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //            switch textField {
    //            case firstName:
    //                firstName.resignFirstResponder()
    //                lastName.becomeFirstResponder()
    //            case lastName:
    //                lastName.resignFirstResponder()
    //                userName.becomeFirstResponder()
    //            case userName:
    //                userName.resignFirstResponder()
    //                mobileNumber.becomeFirstResponder()
    //            case textViewOutlet:
    //                textViewOutlet.resignFirstResponder()
    //                txtPassword.becomeFirstResponder()
    //            case txtPassword:
    //                txtPassword.resignFirstResponder()
    //                confirmPassword.becomeFirstResponder()
    //            default:
    //                textField.becomeFirstResponder()
    //
    //            }
    //            return true
    //        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstName:
            lastName.becomeFirstResponder()
        case lastName:
            userName.becomeFirstResponder()
        case userName:
            mobileNumber.becomeFirstResponder()
        case mobileNumber:
            txtDOB.becomeFirstResponder()
        case txtDOB:
            txtNationality.becomeFirstResponder()
        case txtNationality:
            txtPassword.becomeFirstResponder()
        case txtPassword:
            confirmPassword.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    // Date of Birth
    func CreateDatePicker()
    {
        txtDOB.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        // Set up a target to call dateChanged when the date is changed
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    @objc func dateChanged() {
        // Format the date and set it to the text field
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        txtDOB.text = dateFormatter.string(from: datePicker.date)
    }
}

