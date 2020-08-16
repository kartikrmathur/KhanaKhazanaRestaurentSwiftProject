//
//  DatabaseHandler.swift
//  EventApp
//
//  Created by Rakesh on 24/04/18.
//  Copyright © 2018 Baltech. All rights reserved.
//

import Foundation
import SQLite3

class DatabaseHandler: NSObject {
    //database variable
    var db: OpaquePointer?
    //tablelist Variable of type file which is an Array
    var tableList = [file]()
    func copyDatabaseIfNeeded() {
        // Move database file from bundle to documents folder
        
        var db: OpaquePointer? = nil
        var arrUserData: NSMutableArray!
        
        let fileManager = FileManager.default
        let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
//        guard documentsUrl.count != 0 else {
//            return arrUserData// Could not find documents URL
//        }
        
        //set the database file path
        let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("database.sqlite")
        
        //Check if database file exists on the path. If not, then read the database file from the bundle and save it to document path.
        //If already exists, then open database and select user data
        if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
            print("DB does not exist in documents folder")
            //Read the database file from the bundle
            let documentsURL = Bundle.main.resourceURL?.appendingPathComponent("database.sqlite")
            
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
            .appendingPathComponent("database.sqlite")
        
        // open database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        } else {
            
        }
        return db
    }

    //Select user data
    func selectUserData(dbPointer: OpaquePointer) -> NSMutableArray {
        var statement: OpaquePointer?
        var arrUserData = NSMutableArray()
        var arrUserDic: NSMutableDictionary!
        
        //select data from user table
        if sqlite3_prepare_v2(dbPointer, "select id, dishname, cost, filename from file", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error preparing select: \(errmsg)")
        }
        //loop through all the records
        while sqlite3_step(statement) == SQLITE_ROW {
            
            arrUserDic = NSMutableDictionary()
            
            var fileObj: file!
            //userid
            let id:NSInteger = NSInteger(sqlite3_column_int64(statement, 0))
            //arrUse//rDic.setValue(id, forKey: "id")
            var dishname: String = ""
            var cost: String = ""
            var filename: String = ""
           
            //dishname
            if let cString = sqlite3_column_text(statement, 1) {
                dishname = String(cString: cString)
                //arrUserDic.setValue(dishname, forKey: "dishname")
            } else {
                //print("name not found")
            }
            //cost
            if let cString = sqlite3_column_text(statement, 2) {
                cost = String(cString: cString)
                //arrUserDic.setValue(cost, forKey: "cost")
            } else {
                //print("cost not found")
            }
            //filename
            if let cString = sqlite3_column_text(statement, 3) {
                filename = String(cString: cString)
                //arrUserDic.setValue(filename, forKey: "filename")
            } else {
                //print("pic not found")
            }
            fileObj = file(dishname: dishname, cost: cost, filename: filename, id: id)
            arrUserData.add(fileObj)
        }
        
        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        
        statement = nil
        
        return arrUserData
    }
    func Select(dbPointer: OpaquePointer, searchId: NSInteger) -> [file]{
        
        //first empty the list of News
        tableList.removeAll()
        //this is our select query
        let queryString = String.init(format: "SELECT dishname,cost,filename,id from file where id = %d", searchId)
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
            let dishname = String(cString: sqlite3_column_text(stmt, 0))
            let cost = String(cString: sqlite3_column_text(stmt, 1))
            let filename = String(cString: sqlite3_column_text(stmt, 2))
            let id: NSInteger = NSInteger(sqlite3_column_int(stmt, 3))
            // adding values to list
            tableList.append(file(dishname:dishname, cost:cost, filename: filename,id:id))
        }
        
        return tableList
    }
    }
