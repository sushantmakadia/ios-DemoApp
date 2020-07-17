//
//  Post.swift
//  DemoApp
//
//  Created by sm on 06/07/20.
//  Copyright © 2020 sushant. All rights reserved.
//

import Foundation
class Post{
    var caption : String
    var photoUrl : String
    var user_name : String
    init(captiontext:String,photourlString:String,user_name:String) {
        
        caption = captiontext
        photoUrl = photourlString
        self.user_name = user_name
    }
}
