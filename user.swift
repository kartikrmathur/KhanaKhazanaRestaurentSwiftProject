//
//  User.swift
//  KhanaKhazana
//
//  Created by Mathur on 25/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import Foundation
class user{
    
    var id : NSInteger?
    var username: String?
    var password: String?
    var name: String?
    var fathersName: String?
    var mothersName: String?
    var phoneNo: String?
    var emailId: String?
    var address: String?
    var photo: String?
  
    
    init(Id: NSInteger?,Username: String?, Password: String?,Name: String?, FathersName: String?, MothersName: String?,PhoneNo: String?,EmailId:String?,Address: String?, Photo: String?){
        self.id = Id
        self.username = Username
        self.password = Password
        self.name = Name
        self.fathersName = FathersName
        self.mothersName = MothersName
        self.phoneNo = PhoneNo
        self.emailId = EmailId
        self.address = Address
         self.photo = Photo
        
    }
}
