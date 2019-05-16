//
//  ViewController.swift
//  Boner
//
//  Created by Chris on 2017/4/3.
//  Copyright © 2017年 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bonerButton: UIButton!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameInputLine: UIView!
    @IBOutlet weak var passwordInputView: UIView!
    @IBOutlet weak var infoViewTop: NSLayoutConstraint!
    
    var username: String = "" {
        didSet {
            usernameTextField?.text = username
            BonerUserDefaults.username = username
        }
    }
    var password: String = "" {
        didSet {
            passwordTextField?.text = password
            BonerUserDefaults.password = password
        }
    }
    var isSaved: Bool = false {
        didSet {
            BonerUserDefaults.isSaved = isSaved
        }
    }
    var editStatus: String = "" {
        didSet {
            bonerButton.setTitle(editStatus, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username = BonerUserDefaults.username
        password = BonerUserDefaults.password
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        updateUI()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            bonerButton.isEnabled = true
        } else {
            bonerButton.isEnabled = false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if passwordTextField.isFirstResponder {
            bonerButtonTapped(bonerButton)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onUsernameTextField(_ sender: Any) {
        moveInfoView()
    }
    
    @IBAction func onPasswordTextField(_ sender: Any) {
        moveInfoView()
    }

    @IBAction func endEditing(_ sender: Any) {
        moveBackInfoView()
    }
    
    
    @IBAction func bonerButtonTapped(_ sender: UIButton) {
        isSaved = true
        username = usernameTextField.text!
        password = passwordTextField.text!
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        if let text = bonerButton.titleLabel?.text {
            switch text {
            case "Save":
                isSaved = true
                updateUI()
            case "Edit":
                isSaved = false
                updateUI()
            default:
                break
            }
        }
    }
    
    func updateUI() {
        isSaved = BonerUserDefaults.isSaved
        if isSaved {
            UIView.animate(withDuration: 0.5, animations: {
                self.editStatus = "Edit"
                self.infoViewTop.constant = 60
                self.passwordLabel.isHidden = true
                self.usernameInputLine.isHidden = true
                self.passwordInputView.isHidden = true
                self.usernameTextField.isUserInteractionEnabled = false
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.editStatus = "Save"
                self.infoViewTop.constant = 30
                self.passwordLabel.isHidden = false
                self.usernameInputLine.isHidden = false
                self.passwordInputView.isHidden = false
                self.usernameTextField.isUserInteractionEnabled = true
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func moveInfoView() {
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.infoViewTop.constant = 0
            self.view.layoutIfNeeded()
        })
    }

    func moveBackInfoView() {
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.infoViewTop.constant = 30
            self.view.layoutIfNeeded()
        })
    }

}
