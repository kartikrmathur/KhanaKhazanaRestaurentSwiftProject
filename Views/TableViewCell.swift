//
//  TableViewCell.swift
//  new
//
//  Created by Mathur on 03/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnAddCart: UIButton!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
