//
//  TableViewController.swift
//  form
//
//  Created by Mathur on 06/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//


import UIKit
class UserTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var db = userDatabaseViewController()
    var tableList = [user]()
    var myIndex = 0
    @IBOutlet weak var TableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TableView.estimatedRowHeight = 540
        db.create()
        tableList = db.readValues()
        
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
        return 540
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        let user: user
        user = tableList[indexPath.row]
        cell.lblName.text = user.name
        cell.lblFathersName.text = user.fathersName
        cell.lblMothersName.text = user.mothersName
        cell.lblPhoneNo.text = user.phoneNo
        cell.lblEmailId.text = user.emailId
        cell.lblAddress.text = user.address
        cell.lblUserName.text = user.username
        cell.lblPassword.text = user.password
        
        let NSDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let NSUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)
        if let dirPath = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(user.photo!)
            let image = UIImage(contentsOfFile: imageURL.path)
            cell.imgView.image = image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        var fileData = tableList[myIndex] as user
        
        /* var desc = self.storyboard?.instantiateViewController(withIdentifier: "descriptionctrl") as! DescriptionViewController
         
         desc.recordId = fileData.id!
         self.navigationController?.pushViewController(desc, animated: true)
         */
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
