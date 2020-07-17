//
//  notificationViewController.swift
//  DemoApp
//
//  Created by sm on 07/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class notificationViewController: UIViewController {
var post = [Post]()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        loadposts()
        // Do any additional setup after loading the view.
    }
     func loadposts() {
              
        Firestore.firestore().collection("Notification").getDocuments { (snap, err) in
               if err != nil{
                   print("error")
                      
                  }else{
                      for document in (snap?.documents)!{
                          let dict = document.data()
                          let captiontext = dict["msg"] as! String
                          
                           let username = dict["name"] as! String
                       let postd = Post(captiontext: captiontext, photourlString: "",user_name:username)
                          self.post.append(postd)
                          print(self.post)
                          self.tableview.reloadData()
                      }
                  }
              }
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
extension notificationViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notification") as? customtablefornotificationTableViewCell
        cell?.name.text = post[indexPath.row].user_name
        cell?.msg.text = post[indexPath.row].caption
        return cell!
        
        
    }
    
    
}
