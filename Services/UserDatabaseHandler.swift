//
//  DatabaseHandler.swift
//  EventApp
//
//  Created by Rakesh on 24/04/18.
//  Copyright © 2018 Baltech. All rights reserved.
//

import Foundation
import SQLite3

class UserDatabaseHandler: NSObject {
    //database variable
    var db: OpaquePointer?
    //tablelist Variable of type file which is an Array
    var tableList = [user]()
    func copyDatabaseIfNeeded() {
        // Move database file from bundle to documents folder
        
        var db: OpaquePointer? = nil
        var arrUserNameData: NSMutableArray!
        
        let fileManager = FileManager.default
        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        //        guard documentsUrl.count != 0 else {
        //            return arrUserData// Could not find documents URL
        //        }
        
        //set the database file path
        let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("userdatabase.sqlite")
        
        //Check if database file exists on the path. If not, then read the database file from the bundle and save it to document path.
        //If already exists, then open database and select user data
        if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
            print("DB does not exist in documents folder")
            //Read the database file from the bundle
            let documentsURL = Bundle.main.resourceURL?.appendingPathComponent("userdatabase.sqlite")
            
            do {
                try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalDatabaseURL.path)
                
                //Open database
                // db = openDatabase()
                //Select user data and assign it to the array
                //arrUserData = selectUserData(dbPointer: db!)
            } catch let error as NSError {
                print("Couldn't copy file to final location! Error:\(error.description)")
            }
            
        } else {
            print("Database file found at path: \(finalDatabaseURL.path)")
            //Open database
            //db = openDatabase()
            //Select user data and assign it to the array
            //arrUserData = selectUserData(dbPointer: db!)
        }
        
        // return arrUserData
    }
    
    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("userdatabase.sqlite")
        
        // open database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            
        }
        return db
    }
    
    //Select user data
    func selectUserNameData(dbPointer: OpaquePointer) -> NSMutableArray {
        var statement: OpaquePointer?
        var arrUserNameData = NSMutableArray()
        var arrUserNameDic: NSMutableDictionary!
        
        //select data from user table
        if sqlite3_prepare_v2(dbPointer, "select username, password, name,fathersname,mothersname,phoneNo,emailId,address,photo from user", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error preparing select: \(errmsg)")
        }
        //loop through all the records
        while sqlite3_step(statement) == SQLITE_ROW {
            
            arrUserNameDic = NSMutableDictionary()
            
            var fileObj: user!
            //userid
            let id:NSInteger = NSInteger(sqlite3_column_int64(statement, 0))
            //arrUse//rDic.setValue(id, forKey: "id")
            var username: String = ""
            var password: String = ""
            var name: String = ""
            var fathersname: String = ""
            var mothersname: String = ""
            var phoneNo: String = ""
            var emailId: String = ""
            var adress: String = ""
            var photo: String = ""
            
            //username
            if let cString = sqlite3_column_text(statement, 1) {
                username = String(cString: cString)
                //arrUserDic.setValue(dishname, forKey: "dishname")
            } else {
                //print("name not found")
            }
            //password
            if let cString = sqlite3_column_text(statement, 2) {
                password = String(cString: cString)
                //arrUserDic.setValue(password, forKey: "password")
            } else {
                //print("password not found")
            }
            //name
            if let cString = sqlite3_column_text(statement, 3) {
                name = String(cString: cString)
                //arrUserDic.setValue(name, forKey: "name")
            } else {
                //print("name not found")
            }
            //fathersname
            if let cString = sqlite3_column_text(statement, 4) {
                fathersname = String(cString: cString)
                //arrUserDic.setValue(fathersname, forKey: "fathersname")
            } else {
                //print("fathersname not found")
            }
            //mothersname
            if let cString = sqlite3_column_text(statement, 5) {
                mothersname = String(cString: cString)
                //arrUserDic.setValue(mothersname, forKey: "mothersname")
            } else {
                //print("mothersname not found")
            }
            //phoneNO
            if let cString = sqlite3_column_text(statement, 6) {
                phoneNo = String(cString: cString)
                //arrUserDic.setValue(phoneNo, forKey: "phoneNo")
            } else {
                //print("phoneNo not found")
            }
            
            //emailId
            if let cString = sqlite3_column_text(statement, 7) {
                emailId = String(cString: cString)
                //arrUserDic.setValue(emailId, forKey: "emailId")
            } else {
                //print("emailId not found")
            }
            //address
            if let cString = sqlite3_column_text(statement, 6) {
                phoneNo = String(cString: cString)
                //arrUserDic.setValue(phoneNo, forKey: "phoneNo")
            } else {
                //print("phoneNo not found")
            }
            //photo
            if let cString = sqlite3_column_text(statement, 6) {
                photo = String(cString: cString)
                //arrUserDic.setValue(photo, forKey: "photo")
            } else {
                //print("photo not found")
            }
            
            
            fileObj = user(Id: id, Username: username, Password: password, Name: name, FathersName: fathersname, MothersName: mothersname, PhoneNo: phoneNo, EmailId: emailId, Address: adress, Photo: photo)
            arrUserNameData.add(fileObj)
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
        
        return arrUserNameData
    }
    func Select(dbPointer: OpaquePointer, searchId: NSInteger) -> [user]{
        
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = String.init(format: "SELECT username, password, name,fathersname,mothersname,phoneNo,emailId,address,photo from user where id = %d", searchId)
        //preparing the pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(dbPointer, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return tableList
            
        }
        
        //traversing through all records
        while (sqlite3_step(stmt) == SQLITE_ROW){
           let id: NSInteger = NSInteger(sqlite3_column_int(stmt, 0))
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            let Name = String(cString: sqlite3_column_text(stmt, 3))
            let FathersName = String(cString: sqlite3_column_text(stmt, 4))
            let MothersName = String(cString: sqlite3_column_text(stmt, 5))
            let PhoneNo = String(cString: sqlite3_column_text(stmt, 6))
            let EmailId = String(cString: sqlite3_column_text(stmt, 7))
            let Address = String(cString: sqlite3_column_text(stmt, 8))
             let Photo = String(cString: sqlite3_column_text(stmt, 9))
            // adding values to list
            tableList.append(user(Id:id, Username:username, Password:password,Name: Name, FathersName: FathersName, MothersName: MothersName,PhoneNo: PhoneNo, EmailId: EmailId, Address: Address, Photo: Photo))
        }
        
        return tableList
    }
}
//
//  UserDatabaseHandler.swift
//  KhanaKhazana
//
//  Created by Mathur on 25/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

