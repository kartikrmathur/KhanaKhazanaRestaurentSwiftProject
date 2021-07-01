//
//  UserTableViewCell.swift
//  KhanaKhazana
//
//  Created by Mathur on 26/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import Foundation
//
//  TableViewCell.swift
//  form
//
//  Created by Mathur on 06/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFathersName: UILabel!
    @IBOutlet weak var lblMothersName: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    @IBOutlet weak var lblEmailId: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
