//
//  DatabaseViewController.swift
//  new
//
//  Created by Mathur on 03/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit
import SQLite3

class DatabaseViewController: UIViewController {
    //database variable
    var db: OpaquePointer?
    //tablelist Variable of type file which is an Array
    var tableList = [file]()
    //timestamp variable
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    func readValues() -> [file] {
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = "SELECT * FROM file"
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
            let id = NSInteger(sqlite3_column_int(stmt, 0))
            let dishname = String(cString: sqlite3_column_text(stmt, 1))
            let cost = String(cString: sqlite3_column_text(stmt, 2))
            let filename = String(cString: sqlite3_column_text(stmt, 3))
            //add to file of table list
            tableList.append(file(dishname:dishname, cost:cost, filename:filename, id:id))
            
        }
        return tableList
    }
    func insert(dishname : String,cost : String , filename: String) {
        // creating a statement
        var stmt: OpaquePointer?
        //insert query
        let insertStatementString = String.init(format: "INSERT INTO file (dishname , cost, filename) VALUES(\"%@\", \"%@\", \"%@\")", dishname,cost,filename)
        //preparing the query
        if sqlite3_prepare(db, insertStatementString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }else{
            if sqlite3_step(stmt) != SQLITE_DONE{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting news: \(errmsg)")
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
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS file (id INTEGER PRIMARY KEY AUTOINCREMENT, dishname TEXT ,cost TEXT,filename TEXT)",nil,nil,nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
    }
    func Select(searchId: NSInteger) -> [file]{
        
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = String.init(format: "SELECT dishname,cost,filename,id from file where id = %d", searchId)
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
            let dishname = String(cString: sqlite3_column_text(stmt, 0))
            let cost = String(cString: sqlite3_column_text(stmt, 1))
            let filename = String(cString: sqlite3_column_text(stmt, 2))
            let id: NSInteger = NSInteger(sqlite3_column_int(stmt, 3))
            // adding values to list
            tableList.append(file(dishname:dishname, cost:cost, filename: filename,id:id))
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
