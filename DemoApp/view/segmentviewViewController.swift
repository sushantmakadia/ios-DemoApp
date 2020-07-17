//
//  segmentviewViewController.swift
//  DemoApp
//
//  Created by sm on 07/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit

class segmentviewViewController: UIViewController {
    @IBOutlet weak var feedview : UIView!
    @IBOutlet weak var notificationview : UIView!
     @IBOutlet weak var newprofileview : UIView!
    @IBAction func switchview(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            feedview.alpha = 1
            notificationview.alpha = 0
            newprofileview.alpha = 0
        }else if sender.selectedSegmentIndex == 1{
            feedview.alpha = 0
            notificationview.alpha = 1
            newprofileview.alpha = 0
        }else{
            feedview.alpha = 0
            notificationview.alpha = 0
            newprofileview.alpha = 1        }
        
    }
    
    
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
