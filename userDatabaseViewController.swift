//
//  userDatabaseViewController.swift
//  KhanaKhazana
//
//  Created by Mathur on 27/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import Foundation
//
//  DatabaseViewController.swift
//  new
//
//  Created by Mathur on 03/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit
import SQLite3

class userDatabaseViewController: UIViewController {
    //database variable
    var db: OpaquePointer?
    //tablelist Variable of type file which is an Array
    var tableList = [user]()
    //timestamp variable
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    func readValues() -> [user] {
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = "SELECT * FROM user"
        //preparing the pointer
        var stmt:OpaquePointer?
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return tableList
        }
        while (sqlite3_step(stmt) == SQLITE_ROW){
            // read values from DB according to row
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
            //add to file of table list
            tableList.append(user(Id: id, Username: username, Password: password, Name: Name, FathersName: FathersName, MothersName: MothersName, PhoneNo: PhoneNo, EmailId: EmailId, Address: Address, Photo: Photo))
            
        }
        return tableList
    }
    func insert(Username: String, Password: String, Name: String, FathersName: String, MothersName: String, PhoneNo: String, EmailId: String, Address: String, Photo: String)
    {
        // creating a statement
        var stmt: OpaquePointer?
        //insert query
        let insertStatementString = String.init(format: "INSERT INTO user (username, password, name,fathersname,mothersname,phoneNo,emailId,address,photo) VALUES(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\", \"%@\", \"%@\")",Username, Password, Name,FathersName,MothersName,PhoneNo,EmailId,Address,Photo)
        //preparing the query
        if sqlite3_prepare(db, insertStatementString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }else{
            if sqlite3_step(stmt) != SQLITE_DONE{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting user: \(errmsg)")
            }
            // Do any additional setup after loading the view.
        }
        
    }
    func create() {
        // the database file
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("database.sqlite")
        //opening the database
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        // creating table
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS file (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT ,password TEXT,name TEXT,fathersname TEXT,mothersname TEXT,phoneNo TEXT,emailId TEXT,address TEXT,photo TEXT)",nil,nil,nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
    }
    func Select(searchId: NSInteger) -> [user]{
        
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = String.init(format: "SELECT username, password, name,fathersname,mothersname,phoneNo,emailId,address,photo from user where id = %d", searchId)
        //preparing the pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
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
            tableList.append(user( Id:id, Username: username, Password: password, Name: Name, FathersName: FathersName, MothersName: MothersName, PhoneNo: PhoneNo, EmailId: EmailId, Address: Address, Photo: Photo))
        }
        
        return tableList
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
