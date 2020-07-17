//
//  newprofileViewController.swift
//  DemoApp
//
//  Created by sm on 07/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class newprofileViewController: UIViewController {

 
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var birthdatelbl: UILabel!
    var Name: String?
    var username: String?
    
    @IBOutlet weak var gi1: UILabel!
    
    @IBOutlet weak var gi2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyroundcorner(profileImage)
        viewdata()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var usernamelbl: UILabel!
    func viewdata(){
        //let db = Firestore.firestore()
        Constants.datamodel.basicInfoPath.getDocument { (snap, err) in
             if err != nil{
                                   print("error")
                                      
                                  }else{
                       let dict = snap!.data()
                       self.usernamelbl.text = (dict?["User Name"] as! String)
                       
                       self.namelbl.text = " \(dict?["First Name"] as! String)  \(dict?["Last Name"] as! String)"
                                     }        }
        Constants.datamodel.personalInfoPath.getDocument { (snap, err) in
            if err != nil{
                
            }
            else{
                let dict = snap!.data()
                self.birthdatelbl.text = dict?["DOB"] as! String
                self.emaillbl.text = Firebase.Auth.auth().currentUser?.email
                let s = dict?["profilepic url"] as! String
                 if let url = URL(string: s){
                           do {
                               let data = try Data(contentsOf: url)
                            self.profileImage.image = UIImage(data: data)
                           }catch _{
                               print("err loading")
                           }            }
            }
            
        }
                                      
        Constants.datamodel.generalinfoPath.getDocument { (snap, err) in
            if err != nil{
                
            }
            else{
                let dict = snap!.data()
                self.gi1.text = dict?["About Yourself"] as! String
                self.gi2.text = dict?["Self Knowledge"] as! String
                
            }
            
        }

                }

        
    
    func applyroundcorner(_ object: AnyObject) {
           object.layer.cornerRadius=object.frame.size.width/2
           object.layer.masksToBounds = true
       }

}

