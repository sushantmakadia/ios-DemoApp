//
//  LoginViewController.swift
//  DemoApp
//
//  Created by sm on 01/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var forgotbtn: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTexeField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBAction func forgotbtntapped(_ sender: UIButton) {
        
    }
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTexeField.text!) { (result, err) in
          
            if err != nil{
                print("enter valid username or password")
            }
            else{
                print("sucessful")
                self.transitionscreen()
            }
            
    }
    }
      func transitionscreen()  {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.storyboard.otpviewcontroller) as? otpViewController
          view.window?.rootViewController = viewController
          view.window?.makeKeyAndVisible()
          
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha=0
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
