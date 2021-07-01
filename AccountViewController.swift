//
//  MyAccount.swift
//  khanakhazana
//
//  Created by Mathur on 27/05/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//


import UIKit

class AccountViewController: UIViewController
    {
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
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var txtChangeUsername: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var txtChangeAddress: UITextField!
    @IBAction func btnMenu(_ sender: Any) {
            self.performSegue(withIdentifier: "TableViewSegue",sender: self)
    }
    @IBAction func btnAboutUs(_ sender: Any) {
        self.performSegue(withIdentifier: "ScrollViewSegue", sender: self)
    }
    
   }
