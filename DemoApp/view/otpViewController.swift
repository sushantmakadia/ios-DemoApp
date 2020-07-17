//
//  otpViewController.swift
//  DemoApp
//
//  Created by sm on 16/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit

class otpViewController: UIViewController {

    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf1: UITextField!
    
    @IBOutlet weak var errorlbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBAction func btntapped(_ sender: UIButton) {
        var error = validation()
        if error != nil{
            showError(message: error!)
        }
        else{
            transitionscreen()
        }
    }
    func validation() -> String? {
        if tf1.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           tf2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           tf3.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           tf4.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "plese fill all the fields correctly."
        }
        
        return nil    }
    override func viewDidLoad() {
        super.viewDidLoad()
        errorlbl.alpha = 0
        tf1.becomeFirstResponder()
        tf1.addTarget(self, action: #selector(self.textdidchange(textfield:)), for: UIControl.Event.editingChanged)
        tf2.addTarget(self, action: #selector(self.textdidchange(textfield:)), for: UIControl.Event.editingChanged)
        tf3.addTarget(self, action: #selector(self.textdidchange(textfield:)), for: UIControl.Event.editingChanged)
        tf4.addTarget(self, action: #selector(self.textdidchange(textfield:)), for: UIControl.Event.editingChanged)        // Do any additional setup after loading the view.
    }
    func transitionscreen()  {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.storyboard.segmentviewcontroller) as? segmentviewViewController
        view.window?.rootViewController = viewController
        view.window?.makeKeyAndVisible()
        
    }
     func showError(message:String )  {
           errorlbl.text = message
           errorlbl.alpha=1
       }
    @objc func textdidchange(textfield : UITextField)  {
        let text = textfield.text
        if text?.utf16.count == 1{
            switch textfield {
            case tf1:
                tf2.becomeFirstResponder()
                break
            case tf2:
                tf3.becomeFirstResponder()
                break
            case tf3:
                tf4.becomeFirstResponder()
                break
            case tf4:
                tf4.resignFirstResponder()
                break
            default:
                break
            }
        }else{
            
        }
    }

}
