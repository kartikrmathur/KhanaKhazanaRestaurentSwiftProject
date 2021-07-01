//
//  ViewController.swift
//  new
//
//  Created by Mathur on 03/07/18.
//  Copyright © 2018 Apple inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
   
    var db: OpaquePointer?
    var database = DatabaseViewController()
    var tableList = [file]()
    var imagePicker = UIImagePickerController()
    var filename = ""
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cancelSegue", sender: self)
    }
    @IBOutlet weak var lblAddToMenu: UILabel!
    @IBOutlet weak var lbldishname: UILabel!
    @IBOutlet weak var lblcost: UILabel!
    @IBOutlet weak var txtFldDishName: UITextField!
    @IBOutlet weak var txtFieldCost: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnchoose(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
        print("Button capture")
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum;
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func btnAdd(_ sender: Any) {
        let dishname = txtFldDishName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let cost = txtFieldCost.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        saveImageDocumentDirectory()
        getDirectoryPath()
        getImage()
        createDirectory()
        deleteDirectory()
        database.create()
        database.insert(dishname: dishname!, cost: cost!, filename: filename)
        self.performSegue(withIdentifier: "tableViewSegue", sender: self)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgView.contentMode = .scaleAspectFit
        imgView.image = chosenImage
        imagePicker.dismiss(animated: true, completion: nil)
        imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //dismiss(animated:true, completion: nil)
    }
    
        func imagePicker(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            imgView.contentMode = .scaleAspectFit
            imgView.image = chosenImage
            imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            dismiss(animated:true, completion: nil)
        }
    
        //Save Image At Document Directory :
        func saveImageDocumentDirectory()
        {
            filename = "\(NSDate().timeIntervalSince1970 * 1000).jpeg"
            
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(filename)
            
            print("Timestamp: \(Timestamp)")
            print(paths)
            
            let imageData = UIImageJPEGRepresentation(imgView.image!, 0.5)
            fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        }
        
        //Get Document Directory Path
        func getDirectoryPath() -> String {
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let documentsDirectory = paths[0]
            return documentsDirectory
        }
        
        //Get Image from Document Directory
        func getImage(){
            let fileManager = FileManager.default
            let imagePath = (getDirectoryPath() as NSString).appendingPathComponent(".jpeg")
            if fileManager.fileExists(atPath: imagePath){
                self.imgView.image = UIImage(contentsOfFile: imagePath)
            }else{
                print("No Image")
            }
        }
        
        //Create Directory
        func createDirectory(){
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
            if !fileManager.fileExists(atPath: paths){
                try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
            }else{
                print("Already dictionary created.")
            }
        }
        //Delete Directory
        func deleteDirectory(){
            let fileManager = FileManager.default
            let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
            if fileManager.fileExists(atPath: paths){
                try! fileManager.removeItem(atPath: paths)
            }else{
                print("Something wronge.")
            }
           
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



