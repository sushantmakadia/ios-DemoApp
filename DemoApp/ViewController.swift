//
//  ViewController.swift
//  DemoApp
//
//  Created by sm on 01/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
 
    var images:[UIImage]=[]
    
  
    //@IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var loginbtn: UIButton!
    
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  images.append(UIImage(imageLiteralResourceName: "signup-1.jpg"))
       // images.append(UIImage(imageLiteralResourceName: "signup-2.jpg"))
       
        // Do any additional setup after loading the view.
    }
    func animate(imageview:UIImage,images:[UIImage])  {
        
        
    }
    func applyroundcorner(_ object: AnyObject) {
        object.layer.cornerRadius=object.frame.size.width/2
        object.layer.masksToBounds = true
    }


}

