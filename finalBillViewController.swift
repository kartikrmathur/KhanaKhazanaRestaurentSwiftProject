//
//  finalBillViewController.swift
//  new
//
//  Created by Mathur on 19/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

/// Storyboard identifier: FinalBillViewController. Receives cart from TableViewController.
class FinalBillViewController: UIViewController {

    /// Cart items passed from TableViewController when user taps "Order Now".
    var arrSelectedData: NSMutableArray = NSMutableArray()

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
