//
//  generalinfoViewController.swift
//  DemoApp
//
//  Created by sm on 15/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit

class generalinfoViewController: UIViewController {

    
    @IBOutlet weak var knowledgetext: UITextField!
    
    @IBAction func btntapped(_ sender: UIButton) {
        let abouttext = aboutlbl.text
        let knowledgetextfield = knowledgetext.text
        Constants.datamodel.generalinfoPath.setData(["About Yourself" : abouttext! , "Self Knowledge" : knowledgetextfield!])
    }
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var aboutlbl: UITextField!
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
