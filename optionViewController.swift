//
//  optionViewController.swift
//  KhanaKhazana
//
//  Created by Mathur on 27/09/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

class optionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAboutUS(_ sender: Any) {
         self.performSegue(withIdentifier: "AboutUSSegue", sender: self)
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
