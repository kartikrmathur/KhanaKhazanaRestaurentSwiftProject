//
//  DescriptionViewController.swift
//  new
//
//  Created by Mathur on 05/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit
import SQLite3

class DescriptionViewController: UIViewController {
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    var recordId: NSInteger!
    var databaseHandler = DatabaseHandler()
    var tableList = [file]()
    var statement: OpaquePointer?

    override func viewWillAppear(_ animated: Bool) {
        statement=databaseHandler.openDatabase()
        tableList = databaseHandler.Select(dbPointer: statement!, searchId: recordId) as! [file]
        let file: file
        file = tableList[0]
        lblDishName.text = file.dishname
        lblCost.text = file.cost
        
        let NSDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let NSUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
        if let dirPath = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(file.filename!)
            let image = UIImage(contentsOfFile: imageURL.path)
            imgView.image = image
        }
        
        //imgView.image = file.filename
        
    }
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(".jpg")
        if fileManager.fileExists(atPath: imagePath){
            imgView.image = UIImage(contentsOfFile: imagePath)
        }else{
            print("Panic! No Image!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
