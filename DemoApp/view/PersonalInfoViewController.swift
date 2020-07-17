//
//  PersonalInfoViewController.swift
//  DemoApp
//
//  Created by sm on 02/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import UIKit
import Firebase
class PersonalInfoViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var membercountLabel: UILabel!
    @IBOutlet weak var steper: UIStepper!
    
    @IBOutlet weak var datepickerLabel: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var datepickerTextField: UITextField!
    let image_picker = UIImagePickerController()
    let date_picker = UIDatePicker()
    var selectedimage : UIImage!
    var downloadurl:String!
    @IBAction func stepertaped(_ sender: UIStepper) {
        membercountLabel.text = String(sender.value)
    }
    
     
    @IBAction func btnpressed(_ sender: UIButton) {
        let number = membercountLabel.text!
        let date = datepickerTextField.text!
      Constants.datamodel.personalInfoPath.setData(["Family Member" : number,"DOB":date,"profilepic url":downloadurl!])
        }
    func uploadProfileImage(image:UIImage) -> (){
        
        let storageRef = Storage.storage().reference().child("user/\(Auth.auth().currentUser!.uid)")
        guard let imageData = image.jpegData(compressionQuality: 0.75 ) else { return  }
        //let metadata = StorageMetadata()
        //metadata.contentType = "image/jpg"
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metadata){ metadata,error in
            if error != nil {
                print("error/\(error!.localizedDescription)")
                return
            }
            storageRef.downloadURL { (url, err) in
                self.downloadurl = url?.absoluteString
               
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap_gesture = UITapGestureRecognizer(target: self, action: #selector(image_tapped(gesture:)))
        ImageView.addGestureRecognizer(tap_gesture)
        image_picker.delegate = self
        ImageView.layer.masksToBounds = false
        ImageView.layer.cornerRadius = ImageView.frame.height/2
        ImageView.clipsToBounds = true
        ImageView.layer.borderColor=UIColor.black.cgColor
        // Do any additional setup after loading the view.
        createDatePicker()
    }
    
    func createDatePicker()  {
        let Toolbar = UIToolbar()
        Toolbar.sizeToFit()
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        Toolbar.setItems([donebtn], animated: true)
        datepickerTextField.inputAccessoryView = Toolbar
        datepickerTextField.inputView = date_picker
        date_picker.datePickerMode = .date
    }
    
    @objc func donepressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        datepickerTextField.text = formatter.string(from: date_picker.date)
        self.view.endEditing(true)
    }
    @objc func image_tapped(gesture:UITapGestureRecognizer) {
        print("image tapped")
        open_action_sheet()
    }
    func open_action_sheet()  {
        let action_sheet_vc = UIAlertController(title: "Pick Image", message: "", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "camera", style: .default, handler: camera_action)
        let gallery = UIAlertAction(title: "gallery", style: .default, handler: gallery_action)
        let cancel = UIAlertAction(title: "cancel", style: .default, handler: cancel_action)
        action_sheet_vc.addAction(camera)
        action_sheet_vc.addAction(gallery)
        action_sheet_vc.addAction(cancel)
        self.present(action_sheet_vc, animated: true, completion: nil)
    }


func camera_action(action : UIAlertAction) {
    image_picker.sourceType = .camera
    self.present(image_picker, animated: true, completion: nil)
    
}
func gallery_action(action : UIAlertAction) {
    image_picker.sourceType = .photoLibrary
    image_picker.allowsEditing = true
    self.present(image_picker, animated: true, completion: nil)
}
func cancel_action(action : UIAlertAction) {
    
}
}
extension PersonalInfoViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.selectedimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        ImageView.image = selectedimage
        uploadProfileImage(image: selectedimage)
        dismiss(animated: true, completion: nil)
        
    }
}

