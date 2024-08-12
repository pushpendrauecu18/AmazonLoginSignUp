//
//  PrivacyConditionHelp.swift
//  AmazonLoginSignUp
//
//  Created by Pushpendra on 01/07/24.
//

import UIKit
import WebKit
class PrivacyConditionHelp: UIViewController {

    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    //https://www.amazon.in/gp/help/customer/display.html?nodeId=200534380&ref_=footer_privacy
        let url = URL(string: "https://www.amazon.in/gp/help/customer/display.html?nodeId=200545940&ref_=footer_cou")!
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
}
