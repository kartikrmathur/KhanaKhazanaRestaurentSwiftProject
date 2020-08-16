//
//  TableViewController.swift
//  new
//
//  Created by Mathur on 03/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var db: OpaquePointer? = nil
    var databaseHandler = DatabaseHandler()
    var tableList = [file]()
    var myIndex = 0
    var bill:[file] = []
    var arrSelectedData =  NSMutableArray();
   
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var lblMenuPage: UILabel!
    @IBAction func btnBackViewController(_ sender: Any) {
    self.performSegue(withIdentifier: "viewControllerSegue", sender: self)
    }
  
    @IBAction func btnAddToCart(_ sender: Any) {
        
    }
    @IBAction func btnOrderNow(_ sender: UIButton) {
        
        var desc = self.storyboard?.instantiateViewController(withIdentifier: "FinalBillViewController") as! FinalBillViewController
        desc.arrSelectedData = arrSelectedData
        self.navigationController?.pushViewController(desc, animated: true)    }
    
   @objc func btnAddCart(sender: UIButton) {
        
        arrSelectedData.add(tableList[sender.tag])
        
       
        //performSegue(withIdentifier: "descriptionSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TableView.estimatedRowHeight = 140
        db=databaseHandler.openDatabase()
        tableList = databaseHandler.selectUserData(dbPointer: db!) as! [file]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let file: file
        file = tableList[indexPath.row]
        cell.lblDishName.text = file.dishname
        cell.lblCost.text = file.cost
        let NSDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let NSUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
        
        cell.btnAddCart.tag = indexPath.row
        cell.btnAddCart.addTarget(self, action: #selector(TableViewController.btnAddCart(sender:)), for: UIControlEvents.touchUpInside)
       
        
        if let dirPath = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(file.filename!)
            let image = UIImage(contentsOfFile: imageURL.path)
            cell.imgView.image = image
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        var fileData = tableList[myIndex] as file
        
        var desc = self.storyboard?.instantiateViewController(withIdentifier: "descriptionctrl") as! DescriptionViewController
        
        desc.recordId = fileData.id!
        self.navigationController?.pushViewController(desc, animated: true)
        //performSegue(withIdentifier: "descriptionSegue", sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
