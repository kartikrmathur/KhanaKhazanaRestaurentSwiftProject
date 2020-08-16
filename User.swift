//
//  User.swift
//  KhanaKhazana
//
//  Created by Mathur on 25/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import Foundation
class user{
    
    
    var username: String?
    var password: String?
    var userimage: String?
    var id : NSInteger?
    
    init(Username: String?, Password: String?, Userimage: String?,id: NSInteger?){
        self.username = Username
        self.password = Password
        self.userimage = Userimage
        self.id = id
    }
}
