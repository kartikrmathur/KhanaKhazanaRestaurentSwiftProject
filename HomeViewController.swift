//
//  ViewController.swift
//  khanakhazana
//
//  Created by Mathur on 25/05/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit
import SQLite3


class HomeViewController: UIViewController {

     //MARK: PROPERTIES
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblConfirmPassword: UILabel!
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBAction func btnSignUp(_ sender: Any) {
        print ("SignUp button pressed")
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    @IBAction func btnLogin(_ sender: Any)
        {
        print ("login button pressed")
        self.performSegue(withIdentifier: "LoginViewSegue", sender: self)
        }
    @IBOutlet weak var btnSignupThroughgoogle: UIButton!
    
    @IBAction func btnSignupThroughGoogle(_ sender: Any) {
            let alertController = UIAlertController(title: "Sign,Up",message: "Through,Google", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true,completion: nil)
    }
    
    @IBOutlet weak var btnSignUpThroughFacebook: UIButton!
    
    @IBAction func btnSignUpThroughFacebook(_ sender: Any) {
        let alertController = UIAlertController(title: "SignUp", message: "Through FaceBook", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    @IBOutlet weak var BtnsignupThroughinstagram: UIButton!
    
    @IBAction func btnSignUpThroughInstagram(_ sender: Any) {
        let alertController = UIAlertController(title: "SignUp", message: "Through Instagram", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: ACTION
   

   
}

