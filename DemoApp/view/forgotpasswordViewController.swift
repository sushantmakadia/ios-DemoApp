//
//  forgotpasswordViewController.swift
//  DemoApp
//
//  Created by sm on 16/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class forgotpasswordViewController: UIViewController {

    @IBAction func resetbtntapped(_ sender: UIButton) {
        let email = emailtextfield.text
        if email != nil{
            Auth.auth().sendPasswordReset(withEmail: email!) { (error) in
                if error == nil{
                    print("sucess")
                }else{
                    print("failed")
                }
            }
        }
    }
    @IBOutlet weak var resetbtn: UIButton!
    @IBOutlet weak var emailtextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
