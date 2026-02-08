//
//  TableView.swift
//  new
//
//  Created by Mathur on 04/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

class TableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var db = DatabaseViewController()
    var tableList = [file]()
    
    func viewWillAppear(_ animated: Bool) {
        tableList = db.readValues()
    }
    // MARK: - Table view data source
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
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
        if let dirPath = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(file.filename!)
            let image = UIImage(contentsOfFile: imageURL.path)
            cell.imgView.image = image
        }
        return cell
    }
    
}
