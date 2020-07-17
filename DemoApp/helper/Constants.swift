//
//  Constants.swift
//  DemoApp
//
//  Created by sm on 02/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import Foundation
import Firebase
struct Constants{
    struct storyboard {
        static let personalinfoviewcontroller="personalinfo"
        static let otpviewcontroller = "otp"
        static let segmentviewcontroller = "home"
    }
    struct datamodel{
     
        static let basicInfoPath = Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).collection("ProfileData").document("Basicinfo")
        
         static let generalinfoPath = Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).collection("ProfileData").document("Generalinfo")
        
    static let personalInfoPath = Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).collection("ProfileData").document("Personalinfo")
    
     static let notificationPath = Firestore.firestore().collection("Notification")}
}
