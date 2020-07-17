//
//  feedViewController.swift
//  DemoApp
//
//  Created by sm on 07/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class feedViewController: UIViewController {
  
    
var post = [Post]()
  
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        loadposts()
    }
     func loadposts() {
           
           let db = Firestore.firestore()
           db.collection("post").getDocuments { (snap, err) in
            if err != nil{
                print("error")
                   
               }else{
                   for document in (snap?.documents)!{
                       let dict = document.data()
                       let captiontext = dict["caption"] as! String
                       let photourl = dict["url"] as! String
                        let username = dict["user"] as! String
                    let postd = Post(captiontext: captiontext, photourlString: photourl,user_name:username)
                       self.post.append(postd)
                       print(self.post)
                       self.tableview.reloadData()
                   }
               }
           }
       }
   

}
extension feedViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postview") as! customTableViewCell
        if let url = URL(string: post[indexPath.row].photoUrl){
            do {
                let data = try Data(contentsOf: url)
                cell.TableImage?.image = UIImage(data: data)
            }catch _{
                print("err loading")
            }
        }
        cell.TabelLebal?.text = post[indexPath.row].caption
        cell.user_name?.text = post[indexPath.row].user_name
        return cell
    }
    
    
}
