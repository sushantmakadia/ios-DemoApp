//
//  SignUpViewController.swift
//  DemoApp
//
//  Created by sm on 01/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBAction func SignUpTapped(_ sender: UIButton) {
        let Firstname = FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Lastname = LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Usename = UserNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Email = EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let error = valdatateField()
        if(error != nil){
            showError(message: error!)
        }
        else{
            Auth.auth().createUser(withEmail: Email!, password: Password!) { (result, err) in
                if err != nil{
                    self.showError(message: "Error creating user")
                    }else{
                    Constants.datamodel.basicInfoPath.setData(["First Name" : Firstname! ,"Last Name" : Lastname! , "User Name" : Usename!, "Uid" : result!.user.uid]) { (errors) in
                            if errors != nil{
                                self.showError(message: "Error saving User Data")
                            }
                            else{
                                self.transitionscreen()
                        }
                            }
                    }
                      
                }
        }
       
        }
    public func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self.PasswordTextField.text)
    }

    func transitionscreen()  {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.storyboard.personalinfoviewcontroller) as? PersonalInfoViewController
        view.window?.rootViewController = viewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func valdatateField() -> String? {
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           UserNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || isValidPassword() != true
        {
            return "plese fill all the fields correctly."
        }
        
        return nil
    }
     
    func showError(message:String )  {
        ErrorLabel.text = message
        ErrorLabel.alpha=1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ErrorLabel.alpha=0
        // Do any additional setup after loading the view.
    }
    
}

