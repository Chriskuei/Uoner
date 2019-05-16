//
//  TodayViewController.swift
//  Boner Widget
//
//  Created by Chris on 2017/4/3.
//  Copyright © 2017年 Chris. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var loginSwitch: UISwitch!
    
    var status: String = "" {
        didSet {
            statusLabel.text = status
        }
    }
    var username: String = "" {
        didSet {
            usernameLabel.text = username
        }
    }
    var password: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        updateOfflineStatus(prompt: "OFFLINE")
        username = BonerUserDefaults.username
        if username == "" {
            username = "--"
        }
        password = BonerUserDefaults.password
        getOnlineInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func onLoginSwitch(_ sender: Any) {
        if loginSwitch.isOn {
            login()
        } else {
            logout()
        }
    }
    
    // MARK : - login
    
    func login() {
        
        let queryString: String = BonNetwork.getQueryString()
        let parameters = [
            "userId": username.encodeURIComponent(),
            "password": password.encrypt(),
            "service": "",
            "queryString": queryString.encodeURIComponent(),
            "operatorPwd": "",
            "operatorUserId": "",
            "validcode": "",
            "passwordEncrypt": "true"
        ]
        BonNetwork.post(parameters, success: { (value) in
            print(value)
            if value.contains("success"){
                self.getOnlineInfo()
            } else if value.contains("Password is error.") {
                self.updateOfflineStatus(prompt: "PASSWORD ERROR")
            } else if value.contains("User not found.") {
                self.updateOfflineStatus(prompt: "USER NOT FOUND")
            } else if value.contains("Arrearage users.") {
                self.updateOfflineStatus(prompt: "ARREARAGE")
            }
            else {
                self.updateOfflineStatus(prompt: value)
            }
        }) { (error) in
            self.updateOfflineStatus(prompt: "TIMEOUT")
        }
        
    }
    
    // MARK : - logout
    
    func logout() {
        
        BonNetwork.get(URL: BonerConfig.LogoutURL, success: { (value) in
            NSLog(value)
            self.updateOfflineStatus(prompt: "OFFLINE")
        })
        
    }
    
    // MARK : - get online info
    
    func getOnlineInfo() {
        
        BonNetwork.get(URL: BonerConfig.InfoURL, success: { (value) in
            
            NSLog(value)
            if(value.contains("fail")) {
                self.updateOfflineStatus(prompt: "OFFLINE")
            } else {
                self.updateOnlineStatus(value: value)
            }
            
        }) { (error) in
            self.updateOfflineStatus(prompt: "OFFLINE")
        }
        
    }
    
    func updateOnlineStatus(value: String) {
        status = "ONLINE"
        loginSwitch.setOn(true, animated: true)
    }
    
    func updateOfflineStatus(prompt: String) {
        status = prompt
        loginSwitch.setOn(false, animated: true)
    }
}
