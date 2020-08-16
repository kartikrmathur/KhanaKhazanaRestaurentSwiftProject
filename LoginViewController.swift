//
//  LoginViewController.swift
//  khanakhazana
//
//  Created by Mathur on 27/05/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
   override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLogin(_ sender: Any)
    {
        self.performSegue(withIdentifier: "AccountViewSegue", sender: self)
    }
    @IBOutlet weak var lblLoginWithCurrentAccount: UILabel!
    @IBOutlet weak var lblEmailorUsername: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtEmailUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
 
}
