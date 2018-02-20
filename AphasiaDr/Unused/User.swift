////
////  User.swift
////  AphasiaDrill
////
////  Created by Kimaya Desai on 12/10/17.
////  Copyright © 2017 SDSU. All rights reserved.
////
//
//import UIKit
//import FirebaseDatabase
//import Firebase
//import FirebaseAuth
//
//class User{
//    var username: String
//    var uid : String
//    var fullName : String
//    var profileImage: UIImage?
//    var email: String
//
//    init(uid: String,username: String,profileImage: UIImage,email:String,fullName:String)
//    {
//        self.uid = uid
//        self.username = username
//        self.profileImage = profileImage
//        self.email = email
//        self.fullName = fullName
//    }
//
//    init(username: String,profileImage: UIImage)
//    {
//        self.uid = ""
//        self.username = username
//        self.profileImage = profileImage
//        self.email = ""
//        self.fullName = ""
//    }
//
//    func save()
//    {
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
//
//        let key = ref.child("uid")
//       key.setValue(toDictionary())
//
//
//        }
//    }
//
//    func toDictionary() -> [String : Any]
//    {
//
//        return [
//            "uid" : uid,
//            "username" : username,
//            "fullName" : fullName,
//            "email" : email
//
//        ]
//    }
//}

