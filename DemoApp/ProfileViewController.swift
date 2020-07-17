//
//  ProfileViewController.swift
//  DemoApp
//
//  Created by sm on 01/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//
/*
import UIKit
import Firebase
class ProfileViewController: UIViewController {
 var post = [Post]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
     //   loadposts()
        // Do any additional setup after loading the view.
    }
    

    func loadposts() {
        print(1111111)
        let db = Firestore.firestore()
        db.collection("post").getDocuments { (snap, err) in
            if let err = err{
                print("error")
                
            }else{
                for document in (snap?.documents)!{
                    let dict = document.data()
                    let captiontext = dict["caption"] as! String
                    let photourl = dict["url"] as! String
                    let postd = Post(captiontext: captiontext, photourlString: photourl)
                    self.post.append(postd)
                    print(self.post)
                    
                }
            }
        }
    }
}

*/
